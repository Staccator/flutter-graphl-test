// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.12

part of 'graphql_api.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetBook$Query$Book _$GetBook$Query$BookFromJson(Map<String, dynamic> json) {
  return GetBook$Query$Book()
    ..$$typename = json['__typename'] as String?
    ..id = json['id'] as String
    ..title = json['title'] as String
    ..author = BookFragmentMixin$Author.fromJson(
        json['author'] as Map<String, dynamic>);
}

Map<String, dynamic> _$GetBook$Query$BookToJson(GetBook$Query$Book instance) =>
    <String, dynamic>{
      '__typename': instance.$$typename,
      'id': instance.id,
      'title': instance.title,
      'author': instance.author.toJson(),
    };

GetBook$Query _$GetBook$QueryFromJson(Map<String, dynamic> json) {
  return GetBook$Query()
    ..book = json['book'] == null
        ? null
        : GetBook$Query$Book.fromJson(json['book'] as Map<String, dynamic>);
}

Map<String, dynamic> _$GetBook$QueryToJson(GetBook$Query instance) =>
    <String, dynamic>{
      'book': instance.book?.toJson(),
    };

BookFragmentMixin$Author _$BookFragmentMixin$AuthorFromJson(
    Map<String, dynamic> json) {
  return BookFragmentMixin$Author()
    ..$$typename = json['__typename'] as String?
    ..id = json['id'] as String
    ..name = json['name'] as String
    ..language = json['language'] as String;
}

Map<String, dynamic> _$BookFragmentMixin$AuthorToJson(
        BookFragmentMixin$Author instance) =>
    <String, dynamic>{
      '__typename': instance.$$typename,
      'id': instance.id,
      'name': instance.name,
      'language': instance.language,
    };

GetBooks$Query$Book _$GetBooks$Query$BookFromJson(Map<String, dynamic> json) {
  return GetBooks$Query$Book()
    ..$$typename = json['__typename'] as String?
    ..id = json['id'] as String
    ..title = json['title'] as String
    ..author = BookFragmentMixin$Author.fromJson(
        json['author'] as Map<String, dynamic>);
}

Map<String, dynamic> _$GetBooks$Query$BookToJson(
        GetBooks$Query$Book instance) =>
    <String, dynamic>{
      '__typename': instance.$$typename,
      'id': instance.id,
      'title': instance.title,
      'author': instance.author.toJson(),
    };

GetBooks$Query _$GetBooks$QueryFromJson(Map<String, dynamic> json) {
  return GetBooks$Query()
    ..books = (json['books'] as List<dynamic>)
        .map((e) => GetBooks$Query$Book.fromJson(e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$GetBooks$QueryToJson(GetBooks$Query instance) =>
    <String, dynamic>{
      'books': instance.books.map((e) => e.toJson()).toList(),
    };

UpdateAuthorName$Mutation$Author _$UpdateAuthorName$Mutation$AuthorFromJson(
    Map<String, dynamic> json) {
  return UpdateAuthorName$Mutation$Author()
    ..$$typename = json['__typename'] as String?
    ..id = json['id'] as String
    ..name = json['name'] as String
    ..language = json['language'] as String;
}

Map<String, dynamic> _$UpdateAuthorName$Mutation$AuthorToJson(
        UpdateAuthorName$Mutation$Author instance) =>
    <String, dynamic>{
      '__typename': instance.$$typename,
      'id': instance.id,
      'name': instance.name,
      'language': instance.language,
    };

UpdateAuthorName$Mutation _$UpdateAuthorName$MutationFromJson(
    Map<String, dynamic> json) {
  return UpdateAuthorName$Mutation()
    ..updateAuthorName = json['updateAuthorName'] == null
        ? null
        : UpdateAuthorName$Mutation$Author.fromJson(
            json['updateAuthorName'] as Map<String, dynamic>);
}

Map<String, dynamic> _$UpdateAuthorName$MutationToJson(
        UpdateAuthorName$Mutation instance) =>
    <String, dynamic>{
      'updateAuthorName': instance.updateAuthorName?.toJson(),
    };

UpdateBookTitle$Mutation$Book _$UpdateBookTitle$Mutation$BookFromJson(
    Map<String, dynamic> json) {
  return UpdateBookTitle$Mutation$Book()
    ..$$typename = json['__typename'] as String?
    ..id = json['id'] as String
    ..title = json['title'] as String
    ..author = BookFragmentMixin$Author.fromJson(
        json['author'] as Map<String, dynamic>);
}

Map<String, dynamic> _$UpdateBookTitle$Mutation$BookToJson(
        UpdateBookTitle$Mutation$Book instance) =>
    <String, dynamic>{
      '__typename': instance.$$typename,
      'id': instance.id,
      'title': instance.title,
      'author': instance.author.toJson(),
    };

UpdateBookTitle$Mutation _$UpdateBookTitle$MutationFromJson(
    Map<String, dynamic> json) {
  return UpdateBookTitle$Mutation()
    ..updateBookTitle = json['updateBookTitle'] == null
        ? null
        : UpdateBookTitle$Mutation$Book.fromJson(
            json['updateBookTitle'] as Map<String, dynamic>);
}

Map<String, dynamic> _$UpdateBookTitle$MutationToJson(
        UpdateBookTitle$Mutation instance) =>
    <String, dynamic>{
      'updateBookTitle': instance.updateBookTitle?.toJson(),
    };

GetBookArguments _$GetBookArgumentsFromJson(Map<String, dynamic> json) {
  return GetBookArguments(
    id: json['id'] as String,
  );
}

Map<String, dynamic> _$GetBookArgumentsToJson(GetBookArguments instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

UpdateAuthorNameArguments _$UpdateAuthorNameArgumentsFromJson(
    Map<String, dynamic> json) {
  return UpdateAuthorNameArguments(
    id: json['id'] as String,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$UpdateAuthorNameArgumentsToJson(
        UpdateAuthorNameArguments instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

UpdateBookTitleArguments _$UpdateBookTitleArgumentsFromJson(
    Map<String, dynamic> json) {
  return UpdateBookTitleArguments(
    id: json['id'] as String,
    title: json['title'] as String,
  );
}

Map<String, dynamic> _$UpdateBookTitleArgumentsToJson(
        UpdateBookTitleArguments instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };
