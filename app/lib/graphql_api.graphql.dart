// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart = 2.12

import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'graphql_api.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class Books$Query$Book extends JsonSerializable with EquatableMixin {
  Books$Query$Book();

  factory Books$Query$Book.fromJson(Map<String, dynamic> json) =>
      _$Books$Query$BookFromJson(json);

  @JsonKey(name: '__typename')
  String? $$typename;

  late String id;

  late String title;

  late String author;

  @override
  List<Object?> get props => [$$typename, id, title, author];
  Map<String, dynamic> toJson() => _$Books$Query$BookToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Books$Query extends JsonSerializable with EquatableMixin {
  Books$Query();

  factory Books$Query.fromJson(Map<String, dynamic> json) =>
      _$Books$QueryFromJson(json);

  late List<Books$Query$Book> books;

  @override
  List<Object?> get props => [books];
  Map<String, dynamic> toJson() => _$Books$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetBook$Query$Book extends JsonSerializable with EquatableMixin {
  GetBook$Query$Book();

  factory GetBook$Query$Book.fromJson(Map<String, dynamic> json) =>
      _$GetBook$Query$BookFromJson(json);

  late String author;

  late String id;

  late String title;

  @override
  List<Object?> get props => [author, id, title];
  Map<String, dynamic> toJson() => _$GetBook$Query$BookToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetBook$Query extends JsonSerializable with EquatableMixin {
  GetBook$Query();

  factory GetBook$Query.fromJson(Map<String, dynamic> json) =>
      _$GetBook$QueryFromJson(json);

  GetBook$Query$Book? book;

  @override
  List<Object?> get props => [book];
  Map<String, dynamic> toJson() => _$GetBook$QueryToJson(this);
}

final BOOKS_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'books'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'books'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: '__typename'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'id'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'title'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'author'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null)
            ]))
      ]))
]);

class BooksQuery extends GraphQLQuery<Books$Query, JsonSerializable> {
  BooksQuery();

  @override
  final DocumentNode document = BOOKS_QUERY_DOCUMENT;

  @override
  final String operationName = 'books';

  @override
  List<Object?> get props => [document, operationName];
  @override
  Books$Query parse(Map<String, dynamic> json) => Books$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class GetBookArguments extends JsonSerializable with EquatableMixin {
  GetBookArguments({required this.id});

  @override
  factory GetBookArguments.fromJson(Map<String, dynamic> json) =>
      _$GetBookArgumentsFromJson(json);

  late String id;

  @override
  List<Object?> get props => [id];
  @override
  Map<String, dynamic> toJson() => _$GetBookArgumentsToJson(this);
}

final GET_BOOK_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'getBook'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'id')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'book'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'id'),
                  value: VariableNode(name: NameNode(value: 'id')))
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'author'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'id'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null),
              FieldNode(
                  name: NameNode(value: 'title'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: null)
            ]))
      ]))
]);

class GetBookQuery extends GraphQLQuery<GetBook$Query, GetBookArguments> {
  GetBookQuery({required this.variables});

  @override
  final DocumentNode document = GET_BOOK_QUERY_DOCUMENT;

  @override
  final String operationName = 'getBook';

  @override
  final GetBookArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  GetBook$Query parse(Map<String, dynamic> json) =>
      GetBook$Query.fromJson(json);
}
