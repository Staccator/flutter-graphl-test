import 'dart:async';

import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import 'package:graphql_repro/graphql_api.graphql.dart';
import 'package:normalize/normalize.dart';

final graphqlClient = GraphQLClient(
  link: HttpLink('http://localhost:4000'),
  cache: GraphQLCache(
    typePolicies: {
      // not needed, but might be useful for custom cache keys
      'Book': TypePolicy(),
      'Author': TypePolicy(),
    },
  ),
);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<BookFragmentMixin> books = [];

  late StreamSubscription<QueryResult> watchQuery;

  @override
  void initState() {
    super.initState();

    watchQuery = graphqlClient
        .watchQuery(
          WatchQueryOptions(
            document: GetBooksQuery().document,
            fetchResults: true,
          ),
        )
        .stream
        .listen((result) {
      if (result.data != null) {
        print(result.data);
        setState(() {
          books = GetBooksQuery().parse(result.data!).books;
        });
      }
    });
  }

  @override
  void dispose() {
    watchQuery.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Books'),
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) => BookFragmentView(books[index]),
      ),
    );
  }
}

class BookFragmentView extends StatelessWidget {
  final BookFragmentMixin book;
  const BookFragmentView(this.book);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(book.title),
      subtitle: Text('${book.author.name} ${book.author.language}'),
      trailing: Text(book.id),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => BookDetail(book.id)));
      },
    );
  }
}

class BookDetail extends StatefulWidget {
  final String bookId;

  const BookDetail(this.bookId);

  @override
  _BookDetailState createState() => _BookDetailState();
}

class _BookDetailState extends State<BookDetail> {
  TextEditingController controller = TextEditingController();
  GetBook$Query$Book? book;
  dynamic cache = 'Click for cache';

  late StreamSubscription<QueryResult> watchQuery;

  @override
  void initState() {
    fetchBook();
    super.initState();
  }

  @override
  void dispose() {
    watchQuery.cancel();
    super.dispose();
  }

  Future<void> fetchBook() async {
    var query = GetBookQuery(variables: GetBookArguments(id: widget.bookId));
    watchQuery = graphqlClient
        .watchQuery(
          WatchQueryOptions(
            document: query.document,
            variables: query.variables.toJson(),
            fetchResults: true,
          ),
        )
        .stream
        .listen((result) {
      if (result.data != null) {
        print(result.data);
        setState(() {
          book = GetBookQuery(variables: query.variables).parse(result.data!).book;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Book Detail')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (book != null) ...[
              BookFragmentView(book!),
              TextField(controller: controller),
              TextButton(
                onPressed: () => updateBookTitle(),
                child: Text('Update Book Title'),
              ),
              TextButton(
                onPressed: () => updateAuthorName(),
                child: Text('Update Author Name'),
              ),
              TextButton(
                onPressed: () => printCache(),
                child: Text(cache.toString()),
              ),
            ]
          ],
        ),
      ),
    );
  }

  void printCache() {
    setState(() {
      cache = graphqlClient.cache.store.toMap();
    });
    print(graphqlClient.cache.store.toMap());
  }

  void updateAuthorName() {
    var arguments = UpdateAuthorNameArguments(id: book!.author.id, name: '${controller.value.text}');
    graphqlClient.mutate(
      MutationOptions(
        document: UpdateAuthorNameMutation(variables: arguments).document,
        variables: arguments.toJson(),
      ),
    );
  }

  void updateBookTitle() {
    var arguments = UpdateBookTitleArguments(id: widget.bookId, title: '${controller.value.text}');
    graphqlClient.mutate(
      MutationOptions(
        document: UpdateBookTitleMutation(variables: arguments).document,
        variables: arguments.toJson(),
      ),
    );
  }
}
