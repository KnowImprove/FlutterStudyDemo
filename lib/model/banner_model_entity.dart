import 'dart:convert';

import 'package:flutter_study_github/generated/json/banner_model_entity.g.dart';
import 'package:flutter_study_github/generated/json/base/json_field.dart';

@JsonSerializable()
class BannerModelEntity {
  List<BannerModelData>? data;
  int? errorCode;
  String? errorMsg;

  BannerModelEntity();

  factory BannerModelEntity.fromJson(Map<String, dynamic> json) =>
      $BannerModelEntityFromJson(json);

  Map<String, dynamic> toJson() => $BannerModelEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class BannerModelData {
  String? desc;
  int? id;
  String? imagePath;
  int? isVisible;
  int? order;
  String? title;
  int? type;
  String? url;
  String? gePath;

  BannerModelData();

  factory BannerModelData.fromJson(Map<String, dynamic> json) =>
      $BannerModelDataFromJson(json);

  Map<String, dynamic> toJson() => $BannerModelDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
