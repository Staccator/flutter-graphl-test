// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart = 2.12

import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'graphql_api.graphql.g.dart';

mixin BookFragmentMixin {
  @JsonKey(name: '__typename')
  String? $$typename;
  late String id;
  late String title;
  late BookFragmentMixin$Author author;
}
mixin AuthorFragmentMixin {
  @JsonKey(name: '__typename')
  String? $$typename;
  late String id;
  late String name;
  late String language;
}

@JsonSerializable(explicitToJson: true)
class GetBook$Query$Book extends JsonSerializable
    with EquatableMixin, BookFragmentMixin {
  GetBook$Query$Book();

  factory GetBook$Query$Book.fromJson(Map<String, dynamic> json) =>
      _$GetBook$Query$BookFromJson(json);

  @override
  List<Object?> get props => [$$typename, id, title, author];
  @override
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
  @override
  Map<String, dynamic> toJson() => _$GetBook$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class BookFragmentMixin$Author extends JsonSerializable
    with EquatableMixin, AuthorFragmentMixin {
  BookFragmentMixin$Author();

  factory BookFragmentMixin$Author.fromJson(Map<String, dynamic> json) =>
      _$BookFragmentMixin$AuthorFromJson(json);

  @override
  List<Object?> get props => [$$typename, id, name, language];
  @override
  Map<String, dynamic> toJson() => _$BookFragmentMixin$AuthorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetBooks$Query$Book extends JsonSerializable
    with EquatableMixin, BookFragmentMixin {
  GetBooks$Query$Book();

  factory GetBooks$Query$Book.fromJson(Map<String, dynamic> json) =>
      _$GetBooks$Query$BookFromJson(json);

  @override
  List<Object?> get props => [$$typename, id, title, author];
  @override
  Map<String, dynamic> toJson() => _$GetBooks$Query$BookToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetBooks$Query extends JsonSerializable with EquatableMixin {
  GetBooks$Query();

  factory GetBooks$Query.fromJson(Map<String, dynamic> json) =>
      _$GetBooks$QueryFromJson(json);

  late List<GetBooks$Query$Book> books;

  @override
  List<Object?> get props => [books];
  @override
  Map<String, dynamic> toJson() => _$GetBooks$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateAuthorName$Mutation$Author extends JsonSerializable
    with EquatableMixin, AuthorFragmentMixin {
  UpdateAuthorName$Mutation$Author();

  factory UpdateAuthorName$Mutation$Author.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateAuthorName$Mutation$AuthorFromJson(json);

  @override
  List<Object?> get props => [$$typename, id, name, language];
  @override
  Map<String, dynamic> toJson() =>
      _$UpdateAuthorName$Mutation$AuthorToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateAuthorName$Mutation extends JsonSerializable with EquatableMixin {
  UpdateAuthorName$Mutation();

  factory UpdateAuthorName$Mutation.fromJson(Map<String, dynamic> json) =>
      _$UpdateAuthorName$MutationFromJson(json);

  UpdateAuthorName$Mutation$Author? updateAuthorName;

  @override
  List<Object?> get props => [updateAuthorName];
  @override
  Map<String, dynamic> toJson() => _$UpdateAuthorName$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateBookTitle$Mutation$Book extends JsonSerializable
    with EquatableMixin, BookFragmentMixin {
  UpdateBookTitle$Mutation$Book();

  factory UpdateBookTitle$Mutation$Book.fromJson(Map<String, dynamic> json) =>
      _$UpdateBookTitle$Mutation$BookFromJson(json);

  @override
  List<Object?> get props => [$$typename, id, title, author];
  @override
  Map<String, dynamic> toJson() => _$UpdateBookTitle$Mutation$BookToJson(this);
}

@JsonSerializable(explicitToJson: true)
class UpdateBookTitle$Mutation extends JsonSerializable with EquatableMixin {
  UpdateBookTitle$Mutation();

  factory UpdateBookTitle$Mutation.fromJson(Map<String, dynamic> json) =>
      _$UpdateBookTitle$MutationFromJson(json);

  UpdateBookTitle$Mutation$Book? updateBookTitle;

  @override
  List<Object?> get props => [updateBookTitle];
  @override
  Map<String, dynamic> toJson() => _$UpdateBookTitle$MutationToJson(this);
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
              FragmentSpreadNode(
                  name: NameNode(value: 'bookFragment'), directives: [])
            ]))
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'bookFragment'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(name: NameNode(value: 'Book'), isNonNull: false)),
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
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                  name: NameNode(value: 'authorFragment'), directives: [])
            ]))
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'authorFragment'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(name: NameNode(value: 'Author'), isNonNull: false)),
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
            name: NameNode(value: 'name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'language'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null)
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

final GET_BOOKS_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'getBooks'),
      variableDefinitions: [],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'books'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                  name: NameNode(value: 'bookFragment'), directives: [])
            ]))
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'bookFragment'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(name: NameNode(value: 'Book'), isNonNull: false)),
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
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                  name: NameNode(value: 'authorFragment'), directives: [])
            ]))
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'authorFragment'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(name: NameNode(value: 'Author'), isNonNull: false)),
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
            name: NameNode(value: 'name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'language'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null)
      ]))
]);

class GetBooksQuery extends GraphQLQuery<GetBooks$Query, JsonSerializable> {
  GetBooksQuery();

  @override
  final DocumentNode document = GET_BOOKS_QUERY_DOCUMENT;

  @override
  final String operationName = 'getBooks';

  @override
  List<Object?> get props => [document, operationName];
  @override
  GetBooks$Query parse(Map<String, dynamic> json) =>
      GetBooks$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class UpdateAuthorNameArguments extends JsonSerializable with EquatableMixin {
  UpdateAuthorNameArguments({required this.id, required this.name});

  @override
  factory UpdateAuthorNameArguments.fromJson(Map<String, dynamic> json) =>
      _$UpdateAuthorNameArgumentsFromJson(json);

  late String id;

  late String name;

  @override
  List<Object?> get props => [id, name];
  @override
  Map<String, dynamic> toJson() => _$UpdateAuthorNameArgumentsToJson(this);
}

final UPDATE_AUTHOR_NAME_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'updateAuthorName'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'id')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: []),
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'name')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'updateAuthorName'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'id'),
                  value: VariableNode(name: NameNode(value: 'id'))),
              ArgumentNode(
                  name: NameNode(value: 'name'),
                  value: VariableNode(name: NameNode(value: 'name')))
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                  name: NameNode(value: 'authorFragment'), directives: [])
            ]))
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'authorFragment'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(name: NameNode(value: 'Author'), isNonNull: false)),
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
            name: NameNode(value: 'name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'language'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null)
      ]))
]);

class UpdateAuthorNameMutation
    extends GraphQLQuery<UpdateAuthorName$Mutation, UpdateAuthorNameArguments> {
  UpdateAuthorNameMutation({required this.variables});

  @override
  final DocumentNode document = UPDATE_AUTHOR_NAME_MUTATION_DOCUMENT;

  @override
  final String operationName = 'updateAuthorName';

  @override
  final UpdateAuthorNameArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  UpdateAuthorName$Mutation parse(Map<String, dynamic> json) =>
      UpdateAuthorName$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class UpdateBookTitleArguments extends JsonSerializable with EquatableMixin {
  UpdateBookTitleArguments({required this.id, required this.title});

  @override
  factory UpdateBookTitleArguments.fromJson(Map<String, dynamic> json) =>
      _$UpdateBookTitleArgumentsFromJson(json);

  late String id;

  late String title;

  @override
  List<Object?> get props => [id, title];
  @override
  Map<String, dynamic> toJson() => _$UpdateBookTitleArgumentsToJson(this);
}

final UPDATE_BOOK_TITLE_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.mutation,
      name: NameNode(value: 'updateBookTitle'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'id')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: []),
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'title')),
            type:
                NamedTypeNode(name: NameNode(value: 'String'), isNonNull: true),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'updateBookTitle'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'id'),
                  value: VariableNode(name: NameNode(value: 'id'))),
              ArgumentNode(
                  name: NameNode(value: 'title'),
                  value: VariableNode(name: NameNode(value: 'title')))
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                  name: NameNode(value: 'bookFragment'), directives: [])
            ]))
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'bookFragment'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(name: NameNode(value: 'Book'), isNonNull: false)),
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
            selectionSet: SelectionSetNode(selections: [
              FragmentSpreadNode(
                  name: NameNode(value: 'authorFragment'), directives: [])
            ]))
      ])),
  FragmentDefinitionNode(
      name: NameNode(value: 'authorFragment'),
      typeCondition: TypeConditionNode(
          on: NamedTypeNode(name: NameNode(value: 'Author'), isNonNull: false)),
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
            name: NameNode(value: 'name'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null),
        FieldNode(
            name: NameNode(value: 'language'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null)
      ]))
]);

class UpdateBookTitleMutation
    extends GraphQLQuery<UpdateBookTitle$Mutation, UpdateBookTitleArguments> {
  UpdateBookTitleMutation({required this.variables});

  @override
  final DocumentNode document = UPDATE_BOOK_TITLE_MUTATION_DOCUMENT;

  @override
  final String operationName = 'updateBookTitle';

  @override
  final UpdateBookTitleArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  UpdateBookTitle$Mutation parse(Map<String, dynamic> json) =>
      UpdateBookTitle$Mutation.fromJson(json);
}
