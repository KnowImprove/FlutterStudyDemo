import 'dart:convert';

import 'package:flutter_study_github/generated/json/base/json_field.dart';
import 'package:flutter_study_github/generated/json/coin_list_response_model_entity.g.dart';

@JsonSerializable()
class CoinListResponseModelEntity {
  CoinListResponseModelData? data;
  int? errorCode;
  String? errorMsg;

  CoinListResponseModelEntity();

  factory CoinListResponseModelEntity.fromJson(Map<String, dynamic> json) =>
      $CoinListResponseModelEntityFromJson(json);

  Map<String, dynamic> toJson() => $CoinListResponseModelEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CoinListResponseModelData {
  int? curPage;
  List<CoinListResponseModelDataDatas>? datas;
  int? offset;
  bool? over;
  int? pageCount;
  int? size;
  int? total;

  CoinListResponseModelData();

  factory CoinListResponseModelData.fromJson(Map<String, dynamic> json) =>
      $CoinListResponseModelDataFromJson(json);

  Map<String, dynamic> toJson() => $CoinListResponseModelDataToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class CoinListResponseModelDataDatas {
  int? coinCount;
  int? date;
  String? desc;
  int? id;
  String? reason;
  int? type;
  int? userId;
  String? userName;

  CoinListResponseModelDataDatas();

  factory CoinListResponseModelDataDatas.fromJson(Map<String, dynamic> json) =>
      $CoinListResponseModelDataDatasFromJson(json);

  Map<String, dynamic> toJson() => $CoinListResponseModelDataDatasToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
