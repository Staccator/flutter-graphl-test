// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.12

part of 'graphql_api.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Books$Query$Book _$Books$Query$BookFromJson(Map<String, dynamic> json) {
  return Books$Query$Book()
    ..$$typename = json['__typename'] as String?
    ..id = json['id'] as String
    ..title = json['title'] as String
    ..author = json['author'] as String;
}

Map<String, dynamic> _$Books$Query$BookToJson(Books$Query$Book instance) =>
    <String, dynamic>{
      '__typename': instance.$$typename,
      'id': instance.id,
      'title': instance.title,
      'author': instance.author,
    };

Books$Query _$Books$QueryFromJson(Map<String, dynamic> json) {
  return Books$Query()
    ..books = (json['books'] as List<dynamic>)
        .map((e) => Books$Query$Book.fromJson(e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$Books$QueryToJson(Books$Query instance) =>
    <String, dynamic>{
      'books': instance.books.map((e) => e.toJson()).toList(),
    };

GetBook$Query$Book _$GetBook$Query$BookFromJson(Map<String, dynamic> json) {
  return GetBook$Query$Book()
    ..author = json['author'] as String
    ..id = json['id'] as String
    ..title = json['title'] as String;
}

Map<String, dynamic> _$GetBook$Query$BookToJson(GetBook$Query$Book instance) =>
    <String, dynamic>{
      'author': instance.author,
      'id': instance.id,
      'title': instance.title,
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

GetBookArguments _$GetBookArgumentsFromJson(Map<String, dynamic> json) {
  return GetBookArguments(
    id: json['id'] as String,
  );
}

Map<String, dynamic> _$GetBookArgumentsToJson(GetBookArguments instance) =>
    <String, dynamic>{
      'id': instance.id,
    };
