// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.12

part of 'api.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Space _$SpaceFromJson(Map<String, dynamic> json) {
  return Space()
    ..name = json['name'] as String
    ..avatarUrl = json['avatarUrl'] as String?;
}

Map<String, dynamic> _$SpaceToJson(Space instance) => <String, dynamic>{
      'name': instance.name,
      'avatarUrl': instance.avatarUrl,
    };

Post _$PostFromJson(Map<String, dynamic> json) {
  return Post()
    ..$$typename = json['__typename'] as String?
    ..id = json['id'] as String
    ..body = json['body'] as String
    ..publishedAtMillis = json['publishedAtMillis'] as int?
    ..owner = Space.fromJson(json['owner'] as Map<String, dynamic>);
}

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      '__typename': instance.$$typename,
      'id': instance.id,
      'body': instance.body,
      'publishedAtMillis': instance.publishedAtMillis,
      'owner': instance.owner.toJson(),
    };

Report _$ReportFromJson(Map<String, dynamic> json) {
  return Report()
    ..reason = _$enumDecodeNullable(_$ReasonEnumMap, json['reason'],
        unknownValue: Reason.artemisUnknown)
    ..additionalInfo = json['additionalInfo'] as String?;
}

Map<String, dynamic> _$ReportToJson(Report instance) => <String, dynamic>{
      'reason': _$ReasonEnumMap[instance.reason],
      'additionalInfo': instance.additionalInfo,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$ReasonEnumMap = {
  Reason.ads: 'ADS',
  Reason.fakeAccount: 'FAKE_ACCOUNT',
  Reason.hateOrViolence: 'HATE_OR_VIOLENCE',
  Reason.inappropriateContent: 'INAPPROPRIATE_CONTENT',
  Reason.other: 'OTHER',
  Reason.spam: 'SPAM',
  Reason.violationsOfPrivace: 'VIOLATIONS_OF_PRIVACE',
  Reason.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

ReportedPost _$ReportedPostFromJson(Map<String, dynamic> json) {
  return ReportedPost()
    ..post = json['post'] == null
        ? null
        : Post.fromJson(json['post'] as Map<String, dynamic>)
    ..reports = (json['reports'] as List<dynamic>?)
        ?.map((e) =>
            e == null ? null : Report.fromJson(e as Map<String, dynamic>))
        .toList()
    ..reportsCount = json['reportsCount'] as int?;
}

Map<String, dynamic> _$ReportedPostToJson(ReportedPost instance) =>
    <String, dynamic>{
      'post': instance.post?.toJson(),
      'reports': instance.reports?.map((e) => e?.toJson()).toList(),
      'reportsCount': instance.reportsCount,
    };

ReportedPostEdge _$ReportedPostEdgeFromJson(Map<String, dynamic> json) {
  return ReportedPostEdge()
    ..cursor = json['cursor'] as String?
    ..node = json['node'] == null
        ? null
        : ReportedPost.fromJson(json['node'] as Map<String, dynamic>);
}

Map<String, dynamic> _$ReportedPostEdgeToJson(ReportedPostEdge instance) =>
    <String, dynamic>{
      'cursor': instance.cursor,
      'node': instance.node?.toJson(),
    };

ReportedPostConnection _$ReportedPostConnectionFromJson(
    Map<String, dynamic> json) {
  return ReportedPostConnection()
    ..edges = (json['edges'] as List<dynamic>?)
        ?.map((e) => e == null
            ? null
            : ReportedPostEdge.fromJson(e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$ReportedPostConnectionToJson(
        ReportedPostConnection instance) =>
    <String, dynamic>{
      'edges': instance.edges?.map((e) => e?.toJson()).toList(),
    };

GetReports$RootQueryType _$GetReports$RootQueryTypeFromJson(
    Map<String, dynamic> json) {
  return GetReports$RootQueryType()
    ..getReportedPosts = json['getReportedPosts'] == null
        ? null
        : ReportedPostConnection.fromJson(
            json['getReportedPosts'] as Map<String, dynamic>);
}

Map<String, dynamic> _$GetReports$RootQueryTypeToJson(
        GetReports$RootQueryType instance) =>
    <String, dynamic>{
      'getReportedPosts': instance.getReportedPosts?.toJson(),
    };

GetReportsArguments _$GetReportsArgumentsFromJson(Map<String, dynamic> json) {
  return GetReportsArguments(
    first: json['first'] as int?,
    after: json['after'] as String?,
  );
}

Map<String, dynamic> _$GetReportsArgumentsToJson(
        GetReportsArguments instance) =>
    <String, dynamic>{
      'first': instance.first,
      'after': instance.after,
    };
