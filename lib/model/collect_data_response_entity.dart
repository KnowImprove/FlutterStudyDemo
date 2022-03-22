import 'dart:convert';

import 'package:flutter_study_github/generated/json/base/json_field.dart';
import 'package:flutter_study_github/generated/json/collect_data_response_entity.g.dart';

@JsonSerializable()
class CollectDataResponseEntity {
  CollectDataResponseData? data;
  int? errorCode;
  String? errorMsg;

  CollectDataResponseEntity();

  factory CollectDataResponseEntity.fromJson(Map<String, dynamic> json) =>
      $CollectDataResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => $CollectDataResponseEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CollectDataResponseData {
  int? curPage;
  List<CollectDataResponseDataDatas>? datas;
  int? offset;
  bool? over;
  int? pageCount;
  int? size;
  int? total;

  CollectDataResponseData();

  factory CollectDataResponseData.fromJson(Map<String, dynamic> json) =>
      $CollectDataResponseDataFromJson(json);

  Map<String, dynamic> toJson() => $CollectDataResponseDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CollectDataResponseDataDatas {
  String? author;
  int? chapterId;
  String? chapterName;
  int? courseId;
  String? desc;
  String? envelopePic;
  int? id;
  String? link;
  String? niceDate;
  String? origin;
  int? originId;
  int? publishTime;
  String? title;
  int? userId;
  int? visible;
  int? zan;
  bool? collect = true;

  CollectDataResponseDataDatas();

  factory CollectDataResponseDataDatas.fromJson(Map<String, dynamic> json) =>
      $CollectDataResponseDataDatasFromJson(json);

  Map<String, dynamic> toJson() => $CollectDataResponseDataDatasToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
