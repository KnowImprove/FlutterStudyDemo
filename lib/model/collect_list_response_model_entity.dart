import 'dart:convert';

import 'package:flutter_study_github/generated/json/base/json_field.dart';
import 'package:flutter_study_github/generated/json/collect_list_response_model_entity.g.dart';

import 'base_article_item_bean_entity.dart';

@JsonSerializable()
class CollectListResponseModelEntity {
  CollectListResponseModelData? data;
  int? errorCode;
  String? errorMsg;

  CollectListResponseModelEntity();

  factory CollectListResponseModelEntity.fromJson(Map<String, dynamic> json) =>
      $CollectListResponseModelEntityFromJson(json);

  Map<String, dynamic> toJson() => $CollectListResponseModelEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CollectListResponseModelData {
  int? curPage;
  List<CollectListResponseModelDataDatas>? datas;
  int? offset;
  bool? over;
  int? pageCount;
  int? size;
  int? total;

  CollectListResponseModelData();

  factory CollectListResponseModelData.fromJson(Map<String, dynamic> json) =>
      $CollectListResponseModelDataFromJson(json);

  Map<String, dynamic> toJson() => $CollectListResponseModelDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CollectListResponseModelDataDatas extends BaseArticleItemBeanEntity {
  // String? author;
  // int? chapterId;
  // String? chapterName;
  // int? courseId;
  // String? desc;
  // String? envelopePic;
  // int? id;
  // String? link;
  // String? niceDate;
  // String? origin;
  int? originId;
  // int? publishTime;
  // String? title;
  // int? userId;
  // int? visible;
  // int? zan;
  // bool? collect = true;
  // String? superChapterName = "佚名";

  CollectListResponseModelDataDatas();

  factory CollectListResponseModelDataDatas.fromJson(
          Map<String, dynamic> json) =>
      $CollectListResponseModelDataDatasFromJson(json);

  Map<String, dynamic> toJson() =>
      $CollectListResponseModelDataDatasToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
