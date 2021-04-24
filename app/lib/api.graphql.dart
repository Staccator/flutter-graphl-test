// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart = 2.12

import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
import 'package:graphql_repro/coercers.dart';
part 'api.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class Space extends JsonSerializable with EquatableMixin {
  Space();

  factory Space.fromJson(Map<String, dynamic> json) => _$SpaceFromJson(json);

  late String name;

  String? avatarUrl;

  @override
  List<Object?> get props => [name, avatarUrl];
  Map<String, dynamic> toJson() => _$SpaceToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Post extends JsonSerializable with EquatableMixin {
  Post();

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  @JsonKey(name: '__typename')
  String? $$typename;

  late String id;

  late String body;

  int? publishedAtMillis;

  late Space owner;

  @override
  List<Object?> get props => [$$typename, id, body, publishedAtMillis, owner];
  Map<String, dynamic> toJson() => _$PostToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Report extends JsonSerializable with EquatableMixin {
  Report();

  factory Report.fromJson(Map<String, dynamic> json) => _$ReportFromJson(json);

  @JsonKey(unknownEnumValue: Reason.artemisUnknown)
  Reason? reason;

  String? additionalInfo;

  @override
  List<Object?> get props => [reason, additionalInfo];
  Map<String, dynamic> toJson() => _$ReportToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ReportedPost extends JsonSerializable with EquatableMixin {
  ReportedPost();

  factory ReportedPost.fromJson(Map<String, dynamic> json) =>
      _$ReportedPostFromJson(json);

  Post? post;

  List<Report?>? reports;

  int? reportsCount;

  @override
  List<Object?> get props => [post, reports, reportsCount];
  Map<String, dynamic> toJson() => _$ReportedPostToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ReportedPostEdge extends JsonSerializable with EquatableMixin {
  ReportedPostEdge();

  factory ReportedPostEdge.fromJson(Map<String, dynamic> json) =>
      _$ReportedPostEdgeFromJson(json);

  String? cursor;

  ReportedPost? node;

  @override
  List<Object?> get props => [cursor, node];
  Map<String, dynamic> toJson() => _$ReportedPostEdgeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ReportedPostConnection extends JsonSerializable with EquatableMixin {
  ReportedPostConnection();

  factory ReportedPostConnection.fromJson(Map<String, dynamic> json) =>
      _$ReportedPostConnectionFromJson(json);

  List<ReportedPostEdge?>? edges;

  @override
  List<Object?> get props => [edges];
  Map<String, dynamic> toJson() => _$ReportedPostConnectionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetReports$RootQueryType extends JsonSerializable with EquatableMixin {
  GetReports$RootQueryType();

  factory GetReports$RootQueryType.fromJson(Map<String, dynamic> json) =>
      _$GetReports$RootQueryTypeFromJson(json);

  ReportedPostConnection? getReportedPosts;

  @override
  List<Object?> get props => [getReportedPosts];
  Map<String, dynamic> toJson() => _$GetReports$RootQueryTypeToJson(this);
}

enum Reason {
  @JsonValue('ADS')
  ads,
  @JsonValue('FAKE_ACCOUNT')
  fakeAccount,
  @JsonValue('HATE_OR_VIOLENCE')
  hateOrViolence,
  @JsonValue('INAPPROPRIATE_CONTENT')
  inappropriateContent,
  @JsonValue('OTHER')
  other,
  @JsonValue('SPAM')
  spam,
  @JsonValue('VIOLATIONS_OF_PRIVACE')
  violationsOfPrivace,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}

@JsonSerializable(explicitToJson: true)
class GetReportsArguments extends JsonSerializable with EquatableMixin {
  GetReportsArguments({this.first, this.after});

  @override
  factory GetReportsArguments.fromJson(Map<String, dynamic> json) =>
      _$GetReportsArgumentsFromJson(json);

  final int? first;

  final String? after;

  @override
  List<Object?> get props => [first, after];
  @override
  Map<String, dynamic> toJson() => _$GetReportsArgumentsToJson(this);
}

final GET_REPORTS_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
      type: OperationType.query,
      name: NameNode(value: 'getReports'),
      variableDefinitions: [
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'first')),
            type: NamedTypeNode(name: NameNode(value: 'Int'), isNonNull: false),
            defaultValue: DefaultValueNode(value: null),
            directives: []),
        VariableDefinitionNode(
            variable: VariableNode(name: NameNode(value: 'after')),
            type: NamedTypeNode(
                name: NameNode(value: 'String'), isNonNull: false),
            defaultValue: DefaultValueNode(value: null),
            directives: [])
      ],
      directives: [],
      selectionSet: SelectionSetNode(selections: [
        FieldNode(
            name: NameNode(value: 'getReportedPosts'),
            alias: null,
            arguments: [
              ArgumentNode(
                  name: NameNode(value: 'first'),
                  value: VariableNode(name: NameNode(value: 'first'))),
              ArgumentNode(
                  name: NameNode(value: 'after'),
                  value: VariableNode(name: NameNode(value: 'after')))
            ],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                  name: NameNode(value: 'edges'),
                  alias: null,
                  arguments: [],
                  directives: [],
                  selectionSet: SelectionSetNode(selections: [
                    FieldNode(
                        name: NameNode(value: 'cursor'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: null),
                    FieldNode(
                        name: NameNode(value: 'node'),
                        alias: null,
                        arguments: [],
                        directives: [],
                        selectionSet: SelectionSetNode(selections: [
                          FieldNode(
                              name: NameNode(value: 'post'),
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
                                    name: NameNode(value: 'body'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null),
                                FieldNode(
                                    name: NameNode(value: 'publishedAtMillis'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null),
                                FieldNode(
                                    name: NameNode(value: 'owner'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: SelectionSetNode(selections: [
                                      FieldNode(
                                          name: NameNode(value: 'name'),
                                          alias: null,
                                          arguments: [],
                                          directives: [],
                                          selectionSet: null),
                                      FieldNode(
                                          name: NameNode(value: 'avatarUrl'),
                                          alias: null,
                                          arguments: [],
                                          directives: [],
                                          selectionSet: null)
                                    ]))
                              ])),
                          FieldNode(
                              name: NameNode(value: 'reports'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: SelectionSetNode(selections: [
                                FieldNode(
                                    name: NameNode(value: 'reason'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null),
                                FieldNode(
                                    name: NameNode(value: 'additionalInfo'),
                                    alias: null,
                                    arguments: [],
                                    directives: [],
                                    selectionSet: null)
                              ])),
                          FieldNode(
                              name: NameNode(value: 'reportsCount'),
                              alias: null,
                              arguments: [],
                              directives: [],
                              selectionSet: null)
                        ]))
                  ]))
            ]))
      ]))
]);

class GetReportsQuery
    extends GraphQLQuery<GetReports$RootQueryType, GetReportsArguments> {
  GetReportsQuery({required this.variables});

  @override
  final DocumentNode document = GET_REPORTS_QUERY_DOCUMENT;

  @override
  final String operationName = 'getReports';

  @override
  final GetReportsArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  GetReports$RootQueryType parse(Map<String, dynamic> json) =>
      GetReports$RootQueryType.fromJson(json);
}
