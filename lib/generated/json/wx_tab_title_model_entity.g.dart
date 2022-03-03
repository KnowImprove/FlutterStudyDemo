import 'package:flutter_study_github/generated/json/base/json_convert_content.dart';
import 'package:flutter_study_github/model/wx_tab_title_model_entity.dart';

WxTabTitleModelEntity $WxTabTitleModelEntityFromJson(
    Map<String, dynamic> json) {
  final WxTabTitleModelEntity wxTabTitleModelEntity = WxTabTitleModelEntity();
  final List<WxTabTitleModelData>? data =
      jsonConvert.convertListNotNull<WxTabTitleModelData>(json['data']);
  if (data != null) {
    wxTabTitleModelEntity.data = data;
  }
  final int? errorCode = jsonConvert.convert<int>(json['errorCode']);
  if (errorCode != null) {
    wxTabTitleModelEntity.errorCode = errorCode;
  }
  final String? errorMsg = jsonConvert.convert<String>(json['errorMsg']);
  if (errorMsg != null) {
    wxTabTitleModelEntity.errorMsg = errorMsg;
  }
  return wxTabTitleModelEntity;
}

Map<String, dynamic> $WxTabTitleModelEntityToJson(
    WxTabTitleModelEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['data'] = entity.data?.map((v) => v.toJson()).toList();
  data['errorCode'] = entity.errorCode;
  data['errorMsg'] = entity.errorMsg;
  return data;
}

WxTabTitleModelData $WxTabTitleModelDataFromJson(Map<String, dynamic> json) {
  final WxTabTitleModelData wxTabTitleModelData = WxTabTitleModelData();
  final List<dynamic>? children =
      jsonConvert.convertListNotNull<dynamic>(json['children']);
  if (children != null) {
    wxTabTitleModelData.children = children;
  }
  final int? courseId = jsonConvert.convert<int>(json['courseId']);
  if (courseId != null) {
    wxTabTitleModelData.courseId = courseId;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    wxTabTitleModelData.id = id;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    wxTabTitleModelData.name = name;
  }
  final int? order = jsonConvert.convert<int>(json['order']);
  if (order != null) {
    wxTabTitleModelData.order = order;
  }
  final int? parentChapterId =
      jsonConvert.convert<int>(json['parentChapterId']);
  if (parentChapterId != null) {
    wxTabTitleModelData.parentChapterId = parentChapterId;
  }
  final bool? userControlSetTop =
      jsonConvert.convert<bool>(json['userControlSetTop']);
  if (userControlSetTop != null) {
    wxTabTitleModelData.userControlSetTop = userControlSetTop;
  }
  final int? visible = jsonConvert.convert<int>(json['visible']);
  if (visible != null) {
    wxTabTitleModelData.visible = visible;
  }
  return wxTabTitleModelData;
}

Map<String, dynamic> $WxTabTitleModelDataToJson(WxTabTitleModelData entity) {
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
