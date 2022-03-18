import 'dart:convert';

import 'package:flutter_study_github/generated/json/base/json_field.dart';
import 'package:flutter_study_github/generated/json/seach_hot_key_model_entity.g.dart';

@JsonSerializable()
class SeachHotKeyModelEntity {
  List<SeachHotKeyModelData>? data;
  int? errorCode;
  String? errorMsg;

  SeachHotKeyModelEntity();

  factory SeachHotKeyModelEntity.fromJson(Map<String, dynamic> json) =>
      $SeachHotKeyModelEntityFromJson(json);

  Map<String, dynamic> toJson() => $SeachHotKeyModelEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class SeachHotKeyModelData {
  int? id;
  String? link;
  String? name;
  int? order;
  int? visible;

  SeachHotKeyModelData();

  factory SeachHotKeyModelData.fromJson(Map<String, dynamic> json) =>
      $SeachHotKeyModelDataFromJson(json);

  Map<String, dynamic> toJson() => $SeachHotKeyModelDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
