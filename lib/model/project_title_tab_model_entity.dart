import 'dart:convert';

import 'package:flutter_study_github/generated/json/base/json_field.dart';
import 'package:flutter_study_github/generated/json/project_title_tab_model_entity.g.dart';

@JsonSerializable()
class ProjectTitleTabModelEntity {
  List<ProjectTitleTabModelData>? data;
  int? errorCode;
  String? errorMsg;

  ProjectTitleTabModelEntity();

  factory ProjectTitleTabModelEntity.fromJson(Map<String, dynamic> json) =>
      $ProjectTitleTabModelEntityFromJson(json);

  Map<String, dynamic> toJson() => $ProjectTitleTabModelEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ProjectTitleTabModelData {
  List<dynamic>? children;
  int? courseId;
  int? id;
  String? name;
  int? order;
  int? parentChapterId;
  bool? userControlSetTop;
  int? visible;

  ProjectTitleTabModelData();

  factory ProjectTitleTabModelData.fromJson(Map<String, dynamic> json) =>
      $ProjectTitleTabModelDataFromJson(json);

  Map<String, dynamic> toJson() => $ProjectTitleTabModelDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
