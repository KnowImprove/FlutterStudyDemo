import 'package:flutter_study_github/generated/json/base/json_convert_content.dart';
import 'package:flutter_study_github/model/coin_list_response_model_entity.dart';

CoinListResponseModelEntity $CoinListResponseModelEntityFromJson(
    Map<String, dynamic> json) {
  final CoinListResponseModelEntity coinListResponseModelEntity =
      CoinListResponseModelEntity();
  final CoinListResponseModelData? data =
      jsonConvert.convert<CoinListResponseModelData>(json['data']);
  if (data != null) {
    coinListResponseModelEntity.data = data;
  }
  final int? errorCode = jsonConvert.convert<int>(json['errorCode']);
  if (errorCode != null) {
    coinListResponseModelEntity.errorCode = errorCode;
  }
  final String? errorMsg = jsonConvert.convert<String>(json['errorMsg']);
  if (errorMsg != null) {
    coinListResponseModelEntity.errorMsg = errorMsg;
  }
  return coinListResponseModelEntity;
}

Map<String, dynamic> $CoinListResponseModelEntityToJson(
    CoinListResponseModelEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['data'] = entity.data?.toJson();
  data['errorCode'] = entity.errorCode;
  data['errorMsg'] = entity.errorMsg;
  return data;
}

CoinListResponseModelData $CoinListResponseModelDataFromJson(
    Map<String, dynamic> json) {
  final CoinListResponseModelData coinListResponseModelData =
      CoinListResponseModelData();
  final int? curPage = jsonConvert.convert<int>(json['curPage']);
  if (curPage != null) {
    coinListResponseModelData.curPage = curPage;
  }
  final List<CoinListResponseModelDataDatas>? datas = jsonConvert
      .convertListNotNull<CoinListResponseModelDataDatas>(json['datas']);
  if (datas != null) {
    coinListResponseModelData.datas = datas;
  }
  final int? offset = jsonConvert.convert<int>(json['offset']);
  if (offset != null) {
    coinListResponseModelData.offset = offset;
  }
  final bool? over = jsonConvert.convert<bool>(json['over']);
  if (over != null) {
    coinListResponseModelData.over = over;
  }
  final int? pageCount = jsonConvert.convert<int>(json['pageCount']);
  if (pageCount != null) {
    coinListResponseModelData.pageCount = pageCount;
  }
  final int? size = jsonConvert.convert<int>(json['size']);
  if (size != null) {
    coinListResponseModelData.size = size;
  }
  final int? total = jsonConvert.convert<int>(json['total']);
  if (total != null) {
    coinListResponseModelData.total = total;
  }
  return coinListResponseModelData;
}

Map<String, dynamic> $CoinListResponseModelDataToJson(
    CoinListResponseModelData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['curPage'] = entity.curPage;
  data['datas'] = entity.datas?.map((v) => v.toJson()).toList();
  data['offset'] = entity.offset;
  data['over'] = entity.over;
  data['pageCount'] = entity.pageCount;
  data['size'] = entity.size;
  data['total'] = entity.total;
  return data;
}

CoinListResponseModelDataDatas $CoinListResponseModelDataDatasFromJson(
    Map<String, dynamic> json) {
  final CoinListResponseModelDataDatas coinListResponseModelDataDatas =
      CoinListResponseModelDataDatas();
  final int? coinCount = jsonConvert.convert<int>(json['coinCount']);
  if (coinCount != null) {
    coinListResponseModelDataDatas.coinCount = coinCount;
  }
  final int? date = jsonConvert.convert<int>(json['date']);
  if (date != null) {
    coinListResponseModelDataDatas.date = date;
  }
  final String? desc = jsonConvert.convert<String>(json['desc']);
  if (desc != null) {
    coinListResponseModelDataDatas.desc = desc;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    coinListResponseModelDataDatas.id = id;
  }
  final String? reason = jsonConvert.convert<String>(json['reason']);
  if (reason != null) {
    coinListResponseModelDataDatas.reason = reason;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    coinListResponseModelDataDatas.type = type;
  }
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    coinListResponseModelDataDatas.userId = userId;
  }
  final String? userName = jsonConvert.convert<String>(json['userName']);
  if (userName != null) {
    coinListResponseModelDataDatas.userName = userName;
  }
  return coinListResponseModelDataDatas;
}

Map<String, dynamic> $CoinListResponseModelDataDatasToJson(
    CoinListResponseModelDataDatas entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['coinCount'] = entity.coinCount;
  data['date'] = entity.date;
  data['desc'] = entity.desc;
  data['id'] = entity.id;
  data['reason'] = entity.reason;
  data['type'] = entity.type;
  data['userId'] = entity.userId;
  data['userName'] = entity.userName;
  return data;
}
