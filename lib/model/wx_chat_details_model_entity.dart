import 'dart:convert';

import 'package:flutter_study_github/generated/json/base/json_field.dart';
import 'package:flutter_study_github/generated/json/wx_chat_details_model_entity.g.dart';

@JsonSerializable()
class WxChatDetailsModelEntity {
  WxChatDetailsModelData? data;
  int? errorCode;
  String? errorMsg;

  WxChatDetailsModelEntity();

  factory WxChatDetailsModelEntity.fromJson(Map<String, dynamic> json) =>
      $WxChatDetailsModelEntityFromJson(json);

  Map<String, dynamic> toJson() => $WxChatDetailsModelEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class WxChatDetailsModelData {
  int? curPage;
  List<WxChatDetailsModelDataDatas>? datas;
  int? offset;
  bool? over;
  int? pageCount;
  int? size;
  int? total;

  WxChatDetailsModelData();

  factory WxChatDetailsModelData.fromJson(Map<String, dynamic> json) =>
      $WxChatDetailsModelDataFromJson(json);

  Map<String, dynamic> toJson() => $WxChatDetailsModelDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class WxChatDetailsModelDataDatas {
  String? apkLink;
  int? audit;
  String? author;
  bool? canEdit;
  int? chapterId;
  String? chapterName;
  bool? collect;
  int? courseId;
  String? desc;
  String? descMd;
  String? envelopePic;
  bool? fresh;
  String? host;
  int? id;
  String? link;
  String? niceDate;
  String? niceShareDate;
  String? origin;
  String? prefix;
  String? projectLink;
  int? publishTime;
  int? realSuperChapterId;
  int? selfVisible;
  int? shareDate;
  String? shareUser;
  int? superChapterId;
  String? superChapterName;
  List<WxChatDetailsModelDataDatasTags>? tags;
  String? title;
  int? type;
  int? userId;
  int? visible;
  int? zan;

  WxChatDetailsModelDataDatas();

  factory WxChatDetailsModelDataDatas.fromJson(Map<String, dynamic> json) =>
      $WxChatDetailsModelDataDatasFromJson(json);

  Map<String, dynamic> toJson() => $WxChatDetailsModelDataDatasToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class WxChatDetailsModelDataDatasTags {
  String? name;
  String? url;

  WxChatDetailsModelDataDatasTags();

  factory WxChatDetailsModelDataDatasTags.fromJson(Map<String, dynamic> json) =>
      $WxChatDetailsModelDataDatasTagsFromJson(json);

  Map<String, dynamic> toJson() => $WxChatDetailsModelDataDatasTagsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
