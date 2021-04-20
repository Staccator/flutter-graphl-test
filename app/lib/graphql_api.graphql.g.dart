// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.12

part of 'graphql_api.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetBooks$Query$Book _$GetBooks$Query$BookFromJson(Map<String, dynamic> json) {
  return GetBooks$Query$Book()
    ..$$typename = json['__typename'] as String?
    ..id = json['id'] as String
    ..title = json['title'] as String
    ..author = json['author'] as String;
}

Map<String, dynamic> _$GetBooks$Query$BookToJson(
        GetBooks$Query$Book instance) =>
    <String, dynamic>{
      '__typename': instance.$$typename,
      'id': instance.id,
      'title': instance.title,
      'author': instance.author,
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

GetBook$Query$Book _$GetBook$Query$BookFromJson(Map<String, dynamic> json) {
  return GetBook$Query$Book()
    ..$$typename = json['__typename'] as String?
    ..id = json['id'] as String
    ..title = json['title'] as String
    ..author = json['author'] as String;
}

Map<String, dynamic> _$GetBook$Query$BookToJson(GetBook$Query$Book instance) =>
    <String, dynamic>{
      '__typename': instance.$$typename,
      'id': instance.id,
      'title': instance.title,
      'author': instance.author,
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

UpdateBookTitle$Mutation$Book _$UpdateBookTitle$Mutation$BookFromJson(
    Map<String, dynamic> json) {
  return UpdateBookTitle$Mutation$Book()
    ..$$typename = json['__typename'] as String?
    ..id = json['id'] as String
    ..title = json['title'] as String
    ..author = json['author'] as String;
}

Map<String, dynamic> _$UpdateBookTitle$Mutation$BookToJson(
        UpdateBookTitle$Mutation$Book instance) =>
    <String, dynamic>{
      '__typename': instance.$$typename,
      'id': instance.id,
      'title': instance.title,
      'author': instance.author,
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
