import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import 'package:graphql_repro/graphql_api.graphql.dart';
import 'package:normalize/normalize.dart';

final graphqlClient = GraphQLClient(
  link: HttpLink('http://localhost:4000'),
  cache: GraphQLCache(
    typePolicies: {
      'Book': TypePolicy(),
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

  @override
  void initState() {
    super.initState();

    graphqlClient
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
      subtitle: Text(book.author),
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

  @override
  void initState() {
    super.initState();

    fetchBook();
  }

  Future<void> fetchBook() async {
    var query = GetBookQuery(variables: GetBookArguments(id: widget.bookId));
    graphqlClient
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
                onPressed: () {
                  var arguments = UpdateBookTitleArguments(id: widget.bookId, title: '${controller.value.text}');
                  print(arguments.toString());
                  graphqlClient
                      .mutate(
                        MutationOptions(
                          document: UpdateBookTitleMutation(variables: arguments).document,
                          variables: arguments.toJson(),
                        ),
                      )
                      .then((value) => print(value));
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
