import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
// import 'package:graphql_repro/graphql_api.dart';
import 'package:normalize/normalize.dart';

import 'graphql_api.graphql.dart';

final graphqlClient = GraphQLClient(
  link: HttpLink('http://localhost:4000'),
  cache: GraphQLCache(
    typePolicies: {
      'Book': TypePolicy(
        keyFields: {
          'id': true,
        },
      ),
    },
  ),
);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>>? books = <Map<String, dynamic>>[];

  @override
  void initState() {
    super.initState();

    graphqlClient
        .watchQuery(
          WatchQueryOptions(
            document: BooksQuery().document,
            fetchResults: true,
          ),
        )
        .stream
        .listen((result) {
      if (result.data != null) {
        print(result.data);
        setState(() {
          final bookz = BooksQuery().parse(result.data!);
          bookz.books.forEach((b) {
            print('${b.title} ${b.author}');
          });
          books = result.data!['books'].cast<Map<String, dynamic>>();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Books'),
      ),
      body: ListView.builder(
        itemCount: books!.length,
        itemBuilder: (context, index) {
          final book = books![index];

          return ListTile(
            title: Text(
              book['title'],
            ),
            subtitle: Text(
              book['author'],
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => BookDetail(
                    bookId: book['id'],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class BookDetail extends StatefulWidget {
  final String? bookId;

  const BookDetail({
    Key? key,
    this.bookId,
  }) : super(key: key);

  @override
  _BookDetailState createState() => _BookDetailState();
}

final bookTitleMutation = r'''
mutation updateBookTitle($id: String!, $title: String!) {
  updateBookTitle(id: $id, title: $title) {
    id
    title
    author
  }
}
''';

class _BookDetailState extends State<BookDetail> {
  Map<String, dynamic>? book;
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    fetchBook();
  }

  Future<void> fetchBook() async {
    var query = GetBookQuery(variables: GetBookArguments(id: '2'));
    final result = await graphqlClient.query(
      QueryOptions(
        fetchPolicy: FetchPolicy.networkOnly,
        document: query.document,
        variables: query.variables.toJson(),
      ),
    );

    setState(() {
      book = result.data!['book'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Detail'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (book != null) ...[
              Text('Title: ${book!['title']}'),
              Text('Author: ${book!['author']}'),
              TextField(controller: controller),
              TextButton(
                onPressed: () {
                  graphqlClient.mutate(
                    MutationOptions(
                      document: gql(bookTitleMutation),
                      variables: {
                        'id': widget.bookId,
                        'title': '${controller.value.text}',
                      },
                    ),
                  );
                },
                child: Text('Update Title'),
              )
            ]
          ],
        ),
      ),
    );
  }
}
