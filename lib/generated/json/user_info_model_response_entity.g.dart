import 'package:flutter_study_github/generated/json/base/json_convert_content.dart';
import 'package:flutter_study_github/model/user_info_model_response_entity.dart';

UserInfoModelResponseEntity $UserInfoModelResponseEntityFromJson(
    Map<String, dynamic> json) {
  final UserInfoModelResponseEntity userInfoModelResponseEntity =
      UserInfoModelResponseEntity();
  final UserInfoModelResponseData? data =
      jsonConvert.convert<UserInfoModelResponseData>(json['data']);
  if (data != null) {
    userInfoModelResponseEntity.data = data;
  }
  final int? errorCode = jsonConvert.convert<int>(json['errorCode']);
  if (errorCode != null) {
    userInfoModelResponseEntity.errorCode = errorCode;
  }
  final String? errorMsg = jsonConvert.convert<String>(json['errorMsg']);
  if (errorMsg != null) {
    userInfoModelResponseEntity.errorMsg = errorMsg;
  }
  return userInfoModelResponseEntity;
}

Map<String, dynamic> $UserInfoModelResponseEntityToJson(
    UserInfoModelResponseEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['data'] = entity.data?.toJson();
  data['errorCode'] = entity.errorCode;
  data['errorMsg'] = entity.errorMsg;
  return data;
}

UserInfoModelResponseData $UserInfoModelResponseDataFromJson(
    Map<String, dynamic> json) {
  final UserInfoModelResponseData userInfoModelResponseData =
      UserInfoModelResponseData();
  final UserInfoModelResponseDataCoinInfo? coinInfo =
      jsonConvert.convert<UserInfoModelResponseDataCoinInfo>(json['coinInfo']);
  if (coinInfo != null) {
    userInfoModelResponseData.coinInfo = coinInfo;
  }
  final UserInfoModelResponseDataUserInfo? userInfo =
      jsonConvert.convert<UserInfoModelResponseDataUserInfo>(json['userInfo']);
  if (userInfo != null) {
    userInfoModelResponseData.userInfo = userInfo;
  }
  return userInfoModelResponseData;
}

Map<String, dynamic> $UserInfoModelResponseDataToJson(
    UserInfoModelResponseData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['coinInfo'] = entity.coinInfo?.toJson();
  data['userInfo'] = entity.userInfo?.toJson();
  return data;
}

UserInfoModelResponseDataCoinInfo $UserInfoModelResponseDataCoinInfoFromJson(
    Map<String, dynamic> json) {
  final UserInfoModelResponseDataCoinInfo userInfoModelResponseDataCoinInfo =
      UserInfoModelResponseDataCoinInfo();
  final int? coinCount = jsonConvert.convert<int>(json['coinCount']);
  if (coinCount != null) {
    userInfoModelResponseDataCoinInfo.coinCount = coinCount;
  }
  final int? level = jsonConvert.convert<int>(json['level']);
  if (level != null) {
    userInfoModelResponseDataCoinInfo.level = level;
  }
  final String? nickname = jsonConvert.convert<String>(json['nickname']);
  if (nickname != null) {
    userInfoModelResponseDataCoinInfo.nickname = nickname;
  }
  final String? rank = jsonConvert.convert<String>(json['rank']);
  if (rank != null) {
    userInfoModelResponseDataCoinInfo.rank = rank;
  }
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    userInfoModelResponseDataCoinInfo.userId = userId;
  }
  final String? username = jsonConvert.convert<String>(json['username']);
  if (username != null) {
    userInfoModelResponseDataCoinInfo.username = username;
  }
  return userInfoModelResponseDataCoinInfo;
}

Map<String, dynamic> $UserInfoModelResponseDataCoinInfoToJson(
    UserInfoModelResponseDataCoinInfo entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['coinCount'] = entity.coinCount;
  data['level'] = entity.level;
  data['nickname'] = entity.nickname;
  data['rank'] = entity.rank;
  data['userId'] = entity.userId;
  data['username'] = entity.username;
  return data;
}

UserInfoModelResponseDataUserInfo $UserInfoModelResponseDataUserInfoFromJson(
    Map<String, dynamic> json) {
  final UserInfoModelResponseDataUserInfo userInfoModelResponseDataUserInfo =
      UserInfoModelResponseDataUserInfo();
  final bool? admin = jsonConvert.convert<bool>(json['admin']);
  if (admin != null) {
    userInfoModelResponseDataUserInfo.admin = admin;
  }
  final List<dynamic>? chapterTops =
      jsonConvert.convertListNotNull<dynamic>(json['chapterTops']);
  if (chapterTops != null) {
    userInfoModelResponseDataUserInfo.chapterTops = chapterTops;
  }
  final int? coinCount = jsonConvert.convert<int>(json['coinCount']);
  if (coinCount != null) {
    userInfoModelResponseDataUserInfo.coinCount = coinCount;
  }
  final List<int>? collectIds =
      jsonConvert.convertListNotNull<int>(json['collectIds']);
  if (collectIds != null) {
    userInfoModelResponseDataUserInfo.collectIds = collectIds;
  }
  final String? email = jsonConvert.convert<String>(json['email']);
  if (email != null) {
    userInfoModelResponseDataUserInfo.email = email;
  }
  final String? icon = jsonConvert.convert<String>(json['icon']);
  if (icon != null) {
    userInfoModelResponseDataUserInfo.icon = icon;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    userInfoModelResponseDataUserInfo.id = id;
  }
  final String? nickname = jsonConvert.convert<String>(json['nickname']);
  if (nickname != null) {
    userInfoModelResponseDataUserInfo.nickname = nickname;
  }
  final String? password = jsonConvert.convert<String>(json['password']);
  if (password != null) {
    userInfoModelResponseDataUserInfo.password = password;
  }
  final String? publicName = jsonConvert.convert<String>(json['publicName']);
  if (publicName != null) {
    userInfoModelResponseDataUserInfo.publicName = publicName;
  }
  final String? token = jsonConvert.convert<String>(json['token']);
  if (token != null) {
    userInfoModelResponseDataUserInfo.token = token;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    userInfoModelResponseDataUserInfo.type = type;
  }
  final String? username = jsonConvert.convert<String>(json['username']);
  if (username != null) {
    userInfoModelResponseDataUserInfo.username = username;
  }
  return userInfoModelResponseDataUserInfo;
}

Map<String, dynamic> $UserInfoModelResponseDataUserInfoToJson(
    UserInfoModelResponseDataUserInfo entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['admin'] = entity.admin;
  data['chapterTops'] = entity.chapterTops;
  data['coinCount'] = entity.coinCount;
  data['collectIds'] = entity.collectIds;
  data['email'] = entity.email;
  data['icon'] = entity.icon;
  data['id'] = entity.id;
  data['nickname'] = entity.nickname;
  data['password'] = entity.password;
  data['publicName'] = entity.publicName;
  data['token'] = entity.token;
  data['type'] = entity.type;
  data['username'] = entity.username;
  return data;
}
