import 'dart:io';

import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphql_repro/api.graphql.dart';

String get host {
  if (Platform.isAndroid) {
    return '10.0.2.2';
  } else {
    return 'localhost';
  }
}

ValueNotifier<GraphQLClient>? client;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final HttpLink httpLink = HttpLink('https://staging-api.yookos.online/api/v2/graphiql');
  final AuthLink authLink = AuthLink(
      getToken: () async =>
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJ5b29rb3MiLCJleHAiOjE2MTgzNDYzMzgsImlhdCI6MTYxODM0MjczOCwiaXNfYmFubmVkIjpmYWxzZSwiaXNzIjoieW9va29zIiwianRpIjoiMnBxbzQ5YnY4aDVvZ2FqaTdzMDBmazkyIiwibmJmIjoxNjE4MzQyNzM4LCJyb2xlIjoiYWRtaW4iLCJ1c2VyX2lkIjoiNDdmNjc4ZDQtZGIxNS00NzkzLThkNmMtMGJiYmQxOTdhYzIwIn0.wNiBLJCrvuTFWKq3-QZDD_hVLR1eJaP4oIBypoYdrxg');
  final Link link = authLink.concat(httpLink);

  client = ValueNotifier(
    GraphQLClient(link: link, cache: GraphQLCache(store: InMemoryStore())),
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: client,
      child: MaterialApp(
        title: 'Flutter Demo',
        home: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var books = <Map<String, dynamic>>[];

  String? nextCursor;

  @override
  Widget build(BuildContext context) {
    print('[L] ${DateTime.now()}: _HomeScreenState.build');
    return Query(
      options: QueryOptions(
        document: GetReportsQuery(variables: GetReportsArguments(first: 3)).document,
        fetchPolicy: FetchPolicy.networkOnly,
        variables: GetReportsArguments(first: 3).toJson(),
        // pollInterval: Duration(seconds: 2),
      ),
      // Just like in apollo refetch() could be used to manually trigger a refetch
      // while fetchMore() can be used for pagination purpose
      builder: (QueryResult result, {VoidCallback? refetch, FetchMore? fetchMore}) {
        print('[L] ${DateTime.now()}:\n ${result.isLoading} \n ${result.exception}\n ${result.data}');
        if (result.hasException) {
          return Scaffold(body: Center(child: Text(result.exception.toString())));
        }

        if (result.isLoading) {
          return Scaffold(body: Center(child: Text('Loading')));
        }
        final data = GetReportsQuery(variables: GetReportsArguments()).parse(result.data!).getReportedPosts!;

        print('[L] ${DateTime.now()}: ${data.edges!.length}');
        return Scaffold(
          floatingActionButton: FloatingActionButton(onPressed: () {
            nextCursor = data.edges!.last!.cursor;

            FetchMoreOptions opts = FetchMoreOptions(
              variables: {'after': nextCursor},
              updateQuery: (previousData, newData) {
                final previousEdges = previousData!.values.first['edges'] as List<dynamic>;
                final newEdges = newData!.values.first['edges'] as List<dynamic>;
                if (newEdges.isEmpty) {
                  return previousData;
                }
                nextCursor = newEdges.last['cursor'];

                final result = Map<String, dynamic>();
                result[previousData.keys.first] = {
                  'edges': [...previousEdges, ...newEdges]
                };

                return result;
              },
            );
            fetchMore!(opts);
          }),
          body: Center(
            child: ListView(
              children: data.edges!.map((edge) => edge!.node).map((report) => ReportWidget(report: report!)).toList(),
            ),
          ),
        );
      },
    );
  }
}

class ReportWidget extends StatelessWidget {
  const ReportWidget({required this.report});
  final ReportedPost report;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            report.post!.owner.name,
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
          ),
          if (report.post!.owner.avatarUrl != null) Container(width: 100, child: Image.network(report.post!.owner.avatarUrl!)),
          Text(report.post?.body ?? ''),
          Text(report.post!.$$typename!),
        ],
      ),
      subtitle: Text(DateTime.fromMillisecondsSinceEpoch(report.post!.publishedAtMillis!).toString()),
    );
  }
}
