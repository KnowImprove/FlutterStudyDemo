import 'package:flutter_study_github/generated/json/base/json_convert_content.dart';
import 'package:flutter_study_github/model/seach_hot_key_model_entity.dart';

SeachHotKeyModelEntity $SeachHotKeyModelEntityFromJson(
    Map<String, dynamic> json) {
  final SeachHotKeyModelEntity seachHotKeyModelEntity =
      SeachHotKeyModelEntity();
  final List<SeachHotKeyModelData>? data =
      jsonConvert.convertListNotNull<SeachHotKeyModelData>(json['data']);
  if (data != null) {
    seachHotKeyModelEntity.data = data;
  }
  final int? errorCode = jsonConvert.convert<int>(json['errorCode']);
  if (errorCode != null) {
    seachHotKeyModelEntity.errorCode = errorCode;
  }
  final String? errorMsg = jsonConvert.convert<String>(json['errorMsg']);
  if (errorMsg != null) {
    seachHotKeyModelEntity.errorMsg = errorMsg;
  }
  return seachHotKeyModelEntity;
}

Map<String, dynamic> $SeachHotKeyModelEntityToJson(
    SeachHotKeyModelEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['data'] = entity.data?.map((v) => v.toJson()).toList();
  data['errorCode'] = entity.errorCode;
  data['errorMsg'] = entity.errorMsg;
  return data;
}

SeachHotKeyModelData $SeachHotKeyModelDataFromJson(Map<String, dynamic> json) {
  final SeachHotKeyModelData seachHotKeyModelData = SeachHotKeyModelData();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    seachHotKeyModelData.id = id;
  }
  final String? link = jsonConvert.convert<String>(json['link']);
  if (link != null) {
    seachHotKeyModelData.link = link;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    seachHotKeyModelData.name = name;
  }
  final int? order = jsonConvert.convert<int>(json['order']);
  if (order != null) {
    seachHotKeyModelData.order = order;
  }
  final int? visible = jsonConvert.convert<int>(json['visible']);
  if (visible != null) {
    seachHotKeyModelData.visible = visible;
  }
  return seachHotKeyModelData;
}

Map<String, dynamic> $SeachHotKeyModelDataToJson(SeachHotKeyModelData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['link'] = entity.link;
  data['name'] = entity.name;
  data['order'] = entity.order;
  data['visible'] = entity.visible;
  return data;
}
