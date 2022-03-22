import 'package:flutter_study_github/generated/json/base/json_convert_content.dart';
import 'package:flutter_study_github/model/collect_list_response_model_entity.dart';

CollectListResponseModelEntity $CollectListResponseModelEntityFromJson(
    Map<String, dynamic> json) {
  final CollectListResponseModelEntity collectListResponseModelEntity =
      CollectListResponseModelEntity();
  final CollectListResponseModelData? data =
      jsonConvert.convert<CollectListResponseModelData>(json['data']);
  if (data != null) {
    collectListResponseModelEntity.data = data;
  }
  final int? errorCode = jsonConvert.convert<int>(json['errorCode']);
  if (errorCode != null) {
    collectListResponseModelEntity.errorCode = errorCode;
  }
  final String? errorMsg = jsonConvert.convert<String>(json['errorMsg']);
  if (errorMsg != null) {
    collectListResponseModelEntity.errorMsg = errorMsg;
  }
  return collectListResponseModelEntity;
}

Map<String, dynamic> $CollectListResponseModelEntityToJson(
    CollectListResponseModelEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['data'] = entity.data?.toJson();
  data['errorCode'] = entity.errorCode;
  data['errorMsg'] = entity.errorMsg;
  return data;
}

CollectListResponseModelData $CollectListResponseModelDataFromJson(
    Map<String, dynamic> json) {
  final CollectListResponseModelData collectListResponseModelData =
      CollectListResponseModelData();
  final int? curPage = jsonConvert.convert<int>(json['curPage']);
  if (curPage != null) {
    collectListResponseModelData.curPage = curPage;
  }
  final List<CollectListResponseModelDataDatas>? datas = jsonConvert
      .convertListNotNull<CollectListResponseModelDataDatas>(json['datas']);
  if (datas != null) {
    collectListResponseModelData.datas = datas;
  }
  final int? offset = jsonConvert.convert<int>(json['offset']);
  if (offset != null) {
    collectListResponseModelData.offset = offset;
  }
  final bool? over = jsonConvert.convert<bool>(json['over']);
  if (over != null) {
    collectListResponseModelData.over = over;
  }
  final int? pageCount = jsonConvert.convert<int>(json['pageCount']);
  if (pageCount != null) {
    collectListResponseModelData.pageCount = pageCount;
  }
  final int? size = jsonConvert.convert<int>(json['size']);
  if (size != null) {
    collectListResponseModelData.size = size;
  }
  final int? total = jsonConvert.convert<int>(json['total']);
  if (total != null) {
    collectListResponseModelData.total = total;
  }
  return collectListResponseModelData;
}

Map<String, dynamic> $CollectListResponseModelDataToJson(
    CollectListResponseModelData entity) {
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

CollectListResponseModelDataDatas $CollectListResponseModelDataDatasFromJson(
    Map<String, dynamic> json) {
  final CollectListResponseModelDataDatas collectListResponseModelDataDatas =
      CollectListResponseModelDataDatas();
  final String? author = jsonConvert.convert<String>(json['author']);
  if (author != null) {
    collectListResponseModelDataDatas.author = author;
  }
  final int? chapterId = jsonConvert.convert<int>(json['chapterId']);
  if (chapterId != null) {
    collectListResponseModelDataDatas.chapterId = chapterId;
  }
  final String? chapterName = jsonConvert.convert<String>(json['chapterName']);
  if (chapterName != null) {
    collectListResponseModelDataDatas.chapterName = chapterName;
  }
  final int? courseId = jsonConvert.convert<int>(json['courseId']);
  if (courseId != null) {
    collectListResponseModelDataDatas.courseId = courseId;
  }
  final String? desc = jsonConvert.convert<String>(json['desc']);
  if (desc != null) {
    collectListResponseModelDataDatas.desc = desc;
  }
  final String? envelopePic = jsonConvert.convert<String>(json['envelopePic']);
  if (envelopePic != null) {
    collectListResponseModelDataDatas.envelopePic = envelopePic;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    collectListResponseModelDataDatas.id = id;
  }
  final String? link = jsonConvert.convert<String>(json['link']);
  if (link != null) {
    collectListResponseModelDataDatas.link = link;
  }
  final String? niceDate = jsonConvert.convert<String>(json['niceDate']);
  if (niceDate != null) {
    collectListResponseModelDataDatas.niceDate = niceDate;
  }
  final String? origin = jsonConvert.convert<String>(json['origin']);
  if (origin != null) {
    collectListResponseModelDataDatas.origin = origin;
  }
  final int? originId = jsonConvert.convert<int>(json['originId']);
  if (originId != null) {
    collectListResponseModelDataDatas.originId = originId;
  }
  final int? publishTime = jsonConvert.convert<int>(json['publishTime']);
  if (publishTime != null) {
    collectListResponseModelDataDatas.publishTime = publishTime;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    collectListResponseModelDataDatas.title = title;
  }
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    collectListResponseModelDataDatas.userId = userId;
  }
  final int? visible = jsonConvert.convert<int>(json['visible']);
  if (visible != null) {
    collectListResponseModelDataDatas.visible = visible;
  }
  final int? zan = jsonConvert.convert<int>(json['zan']);
  if (zan != null) {
    collectListResponseModelDataDatas.zan = zan;
  }
  return collectListResponseModelDataDatas;
}

Map<String, dynamic> $CollectListResponseModelDataDatasToJson(
    CollectListResponseModelDataDatas entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['author'] = entity.author;
  data['chapterId'] = entity.chapterId;
  data['chapterName'] = entity.chapterName;
  data['courseId'] = entity.courseId;
  data['desc'] = entity.desc;
  data['envelopePic'] = entity.envelopePic;
  data['id'] = entity.id;
  data['link'] = entity.link;
  data['niceDate'] = entity.niceDate;
  data['origin'] = entity.origin;
  data['originId'] = entity.originId;
  data['publishTime'] = entity.publishTime;
  data['title'] = entity.title;
  data['userId'] = entity.userId;
  data['visible'] = entity.visible;
  data['zan'] = entity.zan;
  return data;
}
