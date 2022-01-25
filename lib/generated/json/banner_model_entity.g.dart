import 'package:flutter_study_github/generated/json/base/json_convert_content.dart';
import 'package:flutter_study_github/model/banner_model_entity.dart';

BannerModelEntity $BannerModelEntityFromJson(Map<String, dynamic> json) {
  final BannerModelEntity bannerModelEntity = BannerModelEntity();
  final List<BannerModelData>? data =
      jsonConvert.convertListNotNull<BannerModelData>(json['data']);
  if (data != null) {
    bannerModelEntity.data = data;
  }
  final int? errorCode = jsonConvert.convert<int>(json['errorCode']);
  if (errorCode != null) {
    bannerModelEntity.errorCode = errorCode;
  }
  final String? errorMsg = jsonConvert.convert<String>(json['errorMsg']);
  if (errorMsg != null) {
    bannerModelEntity.errorMsg = errorMsg;
  }
  return bannerModelEntity;
}

Map<String, dynamic> $BannerModelEntityToJson(BannerModelEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['data'] = entity.data?.map((v) => v.toJson()).toList();
  data['errorCode'] = entity.errorCode;
  data['errorMsg'] = entity.errorMsg;
  return data;
}

BannerModelData $BannerModelDataFromJson(Map<String, dynamic> json) {
  final BannerModelData bannerModelData = BannerModelData();
  final String? desc = jsonConvert.convert<String>(json['desc']);
  if (desc != null) {
    bannerModelData.desc = desc;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    bannerModelData.id = id;
  }
  final String? imagePath = jsonConvert.convert<String>(json['imagePath']);
  if (imagePath != null) {
    bannerModelData.imagePath = imagePath;
  }
  final int? isVisible = jsonConvert.convert<int>(json['isVisible']);
  if (isVisible != null) {
    bannerModelData.isVisible = isVisible;
  }
  final int? order = jsonConvert.convert<int>(json['order']);
  if (order != null) {
    bannerModelData.order = order;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    bannerModelData.title = title;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    bannerModelData.type = type;
  }
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    bannerModelData.url = url;
  }
  final String? gePath = jsonConvert.convert<String>(json['gePath']);
  if (gePath != null) {
    bannerModelData.gePath = gePath;
  }
  return bannerModelData;
}

Map<String, dynamic> $BannerModelDataToJson(BannerModelData entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['desc'] = entity.desc;
  data['id'] = entity.id;
  data['imagePath'] = entity.imagePath;
  data['isVisible'] = entity.isVisible;
  data['order'] = entity.order;
  data['title'] = entity.title;
  data['type'] = entity.type;
  data['url'] = entity.url;
  data['gePath'] = entity.gePath;
  return data;
}
