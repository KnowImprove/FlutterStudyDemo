import 'dart:convert';

import 'package:flutter_study_github/generated/json/base/json_field.dart';
import 'package:flutter_study_github/generated/json/user_info_model_response_entity.g.dart';

@JsonSerializable()
class UserInfoModelResponseEntity {
  UserInfoModelResponseData? data;
  int? errorCode;
  String? errorMsg;

  UserInfoModelResponseEntity();

  factory UserInfoModelResponseEntity.fromJson(Map<String, dynamic> json) =>
      $UserInfoModelResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => $UserInfoModelResponseEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class UserInfoModelResponseData {
  UserInfoModelResponseDataCoinInfo? coinInfo;
  UserInfoModelResponseDataUserInfo? userInfo;

  UserInfoModelResponseData();

  factory UserInfoModelResponseData.fromJson(Map<String, dynamic> json) =>
      $UserInfoModelResponseDataFromJson(json);

  Map<String, dynamic> toJson() => $UserInfoModelResponseDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class UserInfoModelResponseDataCoinInfo {
  int? coinCount;
  int? level;
  String? nickname;
  String? rank;
  int? userId;
  String? username;

  UserInfoModelResponseDataCoinInfo();

  factory UserInfoModelResponseDataCoinInfo.fromJson(
          Map<String, dynamic> json) =>
      $UserInfoModelResponseDataCoinInfoFromJson(json);

  Map<String, dynamic> toJson() =>
      $UserInfoModelResponseDataCoinInfoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class UserInfoModelResponseDataUserInfo {
  bool? admin;
  List<dynamic>? chapterTops;
  int? coinCount;
  List<int>? collectIds;
  String? email;
  String? icon;
  int? id;
  String? nickname;
  String? password;
  String? publicName;
  String? token;
  int? type;
  String? username;

  UserInfoModelResponseDataUserInfo();

  factory UserInfoModelResponseDataUserInfo.fromJson(
          Map<String, dynamic> json) =>
      $UserInfoModelResponseDataUserInfoFromJson(json);

  Map<String, dynamic> toJson() =>
      $UserInfoModelResponseDataUserInfoToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
