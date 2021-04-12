// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'graphql_api.g.dart';

@JsonSerializable(explicitToJson: true)
class Books with EquatableMixin {
  Books();

  factory Books.fromJson(Map<String, dynamic> json) => _$BooksFromJson(json);

  List<Book> books;

  @override
  List<Object> get props => [books];
  Map<String, dynamic> toJson() => _$BooksToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Book with EquatableMixin {
  Book();

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);

  String id;

  String title;

  String author;

  @override
  List<Object> get props => [id, title, author];
  Map<String, dynamic> toJson() => _$BookToJson(this);
}

class BooksQuery extends GraphQLQuery<Books, JsonSerializable> {
  BooksQuery();

  @override
  final DocumentNode document = DocumentNode(definitions: [
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

  @override
  final String operationName = 'books';

  @override
  List<Object> get props => [document, operationName];
  @override
  Books parse(Map<String, dynamic> json) => Books.fromJson(json);
}
