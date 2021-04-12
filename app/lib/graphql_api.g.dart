// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'graphql_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Books _$BooksFromJson(Map<String, dynamic> json) {
  return Books()
    ..books = (json['books'] as List)
        ?.map(
            (e) => e == null ? null : Book.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$BooksToJson(Books instance) => <String, dynamic>{
      'books': instance.books?.map((e) => e?.toJson())?.toList(),
    };

Book _$BookFromJson(Map<String, dynamic> json) {
  return Book()
    ..id = json['id'] as String
    ..title = json['title'] as String
    ..author = json['author'] as String;
}

Map<String, dynamic> _$BookToJson(Book instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'author': instance.author,
    };
