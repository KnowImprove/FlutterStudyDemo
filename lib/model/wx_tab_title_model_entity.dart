import 'dart:convert';
import 'package:flutter_study_github/generated/json/base/json_field.dart';
import 'package:flutter_study_github/generated/json/wx_tab_title_model_entity.g.dart';

@JsonSerializable()
class WxTabTitleModelEntity {

	List<WxTabTitleModelData>? data;
	int? errorCode;
	String? errorMsg;
  
  WxTabTitleModelEntity();

  factory WxTabTitleModelEntity.fromJson(Map<String, dynamic> json) => $WxTabTitleModelEntityFromJson(json);

  Map<String, dynamic> toJson() => $WxTabTitleModelEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class WxTabTitleModelData {

	List<dynamic>? children;
	int? courseId;
	int? id;
	String? name;
	int? order;
	int? parentChapterId;
	bool? userControlSetTop;
	int? visible;
  
  WxTabTitleModelData();

  factory WxTabTitleModelData.fromJson(Map<String, dynamic> json) => $WxTabTitleModelDataFromJson(json);

  Map<String, dynamic> toJson() => $WxTabTitleModelDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}