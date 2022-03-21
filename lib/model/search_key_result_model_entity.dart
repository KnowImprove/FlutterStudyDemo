import 'dart:convert';

import 'package:flutter_study_github/generated/json/base/json_field.dart';
import 'package:flutter_study_github/generated/json/search_key_result_model_entity.g.dart';

@JsonSerializable()
class SearchKeyResultModelEntity {
  SearchKeyResultModelData? data;
  int? errorCode;
  String? errorMsg;

  SearchKeyResultModelEntity();

  factory SearchKeyResultModelEntity.fromJson(Map<String, dynamic> json) =>
      $SearchKeyResultModelEntityFromJson(json);

  Map<String, dynamic> toJson() => $SearchKeyResultModelEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class SearchKeyResultModelData {
  int? curPage;
  List<SearchKeyResultModelDataDatas>? datas;
  int? offset;
  bool? over;
  int? pageCount;
  int? size;
  int? total;

  SearchKeyResultModelData();

  factory SearchKeyResultModelData.fromJson(Map<String, dynamic> json) =>
      $SearchKeyResultModelDataFromJson(json);

  Map<String, dynamic> toJson() => $SearchKeyResultModelDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class SearchKeyResultModelDataDatas {
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
  List<dynamic>? tags;
  String? title;
  int? type;
  int? userId;
  int? visible;
  int? zan;

  SearchKeyResultModelDataDatas();

  factory SearchKeyResultModelDataDatas.fromJson(Map<String, dynamic> json) =>
      $SearchKeyResultModelDataDatasFromJson(json);

  Map<String, dynamic> toJson() => $SearchKeyResultModelDataDatasToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
