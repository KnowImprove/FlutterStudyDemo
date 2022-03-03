import 'package:flutter_study_github/generated/json/base/json_convert_content.dart';
import 'package:flutter_study_github/model/project_title_tab_model_entity.dart';

ProjectTitleTabModelEntity $ProjectTitleTabModelEntityFromJson(
    Map<String, dynamic> json) {
  final ProjectTitleTabModelEntity projectTitleTabModelEntity =
      ProjectTitleTabModelEntity();
  final List<ProjectTitleTabModelData>? data =
      jsonConvert.convertListNotNull<ProjectTitleTabModelData>(json['data']);
  if (data != null) {
    projectTitleTabModelEntity.data = data;
  }
  final int? errorCode = jsonConvert.convert<int>(json['errorCode']);
  if (errorCode != null) {
    projectTitleTabModelEntity.errorCode = errorCode;
  }
  final String? errorMsg = jsonConvert.convert<String>(json['errorMsg']);
  if (errorMsg != null) {
    projectTitleTabModelEntity.errorMsg = errorMsg;
  }
  return projectTitleTabModelEntity;
}

Map<String, dynamic> $ProjectTitleTabModelEntityToJson(
    ProjectTitleTabModelEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['data'] = entity.data?.map((v) => v.toJson()).toList();
  data['errorCode'] = entity.errorCode;
  data['errorMsg'] = entity.errorMsg;
  return data;
}

ProjectTitleTabModelData $ProjectTitleTabModelDataFromJson(
    Map<String, dynamic> json) {
  final ProjectTitleTabModelData projectTitleTabModelData =
      ProjectTitleTabModelData();
  final List<dynamic>? children =
      jsonConvert.convertListNotNull<dynamic>(json['children']);
  if (children != null) {
    projectTitleTabModelData.children = children;
  }
  final int? courseId = jsonConvert.convert<int>(json['courseId']);
  if (courseId != null) {
    projectTitleTabModelData.courseId = courseId;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    projectTitleTabModelData.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    projectTitleTabModelData.name = name;
  }
  final int? order = jsonConvert.convert<int>(json['order']);
  if (order != null) {
    projectTitleTabModelData.order = order;
  }
  final int? parentChapterId =
      jsonConvert.convert<int>(json['parentChapterId']);
  if (parentChapterId != null) {
    projectTitleTabModelData.parentChapterId = parentChapterId;
  }
  final bool? userControlSetTop =
      jsonConvert.convert<bool>(json['userControlSetTop']);
  if (userControlSetTop != null) {
    projectTitleTabModelData.userControlSetTop = userControlSetTop;
  }
  final int? visible = jsonConvert.convert<int>(json['visible']);
  if (visible != null) {
    projectTitleTabModelData.visible = visible;
  }
  return projectTitleTabModelData;
}

Map<String, dynamic> $ProjectTitleTabModelDataToJson(
    ProjectTitleTabModelData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['children'] = entity.children;
  data['courseId'] = entity.courseId;
  data['id'] = entity.id;
  data['name'] = entity.name;
  data['order'] = entity.order;
  data['parentChapterId'] = entity.parentChapterId;
  data['userControlSetTop'] = entity.userControlSetTop;
  data['visible'] = entity.visible;
  return data;
}
