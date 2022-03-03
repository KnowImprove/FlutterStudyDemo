import 'dart:convert';

import 'package:flutter_study_github/generated/json/base/json_field.dart';
import 'package:flutter_study_github/generated/json/project_model_item_entity.g.dart';

@JsonSerializable()
class ProjectModelItemEntity {
  ProjectModelItemData? data;
  int? errorCode;
  String? errorMsg;

  ProjectModelItemEntity();

  factory ProjectModelItemEntity.fromJson(Map<String, dynamic> json) =>
      $ProjectModelItemEntityFromJson(json);

  Map<String, dynamic> toJson() => $ProjectModelItemEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ProjectModelItemData {
  int? curPage;
  List<ProjectModelItemDataDatas>? datas;
  int? offset;
  bool? over;
  int? pageCount;
  int? size;
  int? total;

  ProjectModelItemData();

  factory ProjectModelItemData.fromJson(Map<String, dynamic> json) =>
      $ProjectModelItemDataFromJson(json);

  Map<String, dynamic> toJson() => $ProjectModelItemDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ProjectModelItemDataDatas {
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
  List<ProjectModelItemDataDatasTags>? tags;
  String? title;
  int? type;
  int? userId;
  int? visible;
  int? zan;

  ProjectModelItemDataDatas();

  factory ProjectModelItemDataDatas.fromJson(Map<String, dynamic> json) =>
      $ProjectModelItemDataDatasFromJson(json);

  Map<String, dynamic> toJson() => $ProjectModelItemDataDatasToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ProjectModelItemDataDatasTags {
  String? name;
  String? url;

  ProjectModelItemDataDatasTags();

  factory ProjectModelItemDataDatasTags.fromJson(Map<String, dynamic> json) =>
      $ProjectModelItemDataDatasTagsFromJson(json);

  Map<String, dynamic> toJson() => $ProjectModelItemDataDatasTagsToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
