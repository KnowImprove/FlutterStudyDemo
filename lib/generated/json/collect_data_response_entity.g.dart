import 'package:flutter_study_github/generated/json/base/json_convert_content.dart';
import 'package:flutter_study_github/model/collect_data_response_entity.dart';

CollectDataResponseEntity $CollectDataResponseEntityFromJson(
    Map<String, dynamic> json) {
  final CollectDataResponseEntity collectDataResponseEntity =
      CollectDataResponseEntity();
  final CollectDataResponseData? data =
      jsonConvert.convert<CollectDataResponseData>(json['data']);
  if (data != null) {
    collectDataResponseEntity.data = data;
  }
  final int? errorCode = jsonConvert.convert<int>(json['errorCode']);
  if (errorCode != null) {
    collectDataResponseEntity.errorCode = errorCode;
  }
  final String? errorMsg = jsonConvert.convert<String>(json['errorMsg']);
  if (errorMsg != null) {
    collectDataResponseEntity.errorMsg = errorMsg;
  }
  return collectDataResponseEntity;
}

Map<String, dynamic> $CollectDataResponseEntityToJson(
    CollectDataResponseEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['data'] = entity.data?.toJson();
  data['errorCode'] = entity.errorCode;
  data['errorMsg'] = entity.errorMsg;
  return data;
}

CollectDataResponseData $CollectDataResponseDataFromJson(
    Map<String, dynamic> json) {
  final CollectDataResponseData collectDataResponseData =
      CollectDataResponseData();
  final int? curPage = jsonConvert.convert<int>(json['curPage']);
  if (curPage != null) {
    collectDataResponseData.curPage = curPage;
  }
  final List<CollectDataResponseDataDatas>? datas = jsonConvert
      .convertListNotNull<CollectDataResponseDataDatas>(json['datas']);
  if (datas != null) {
    collectDataResponseData.datas = datas;
  }
  final int? offset = jsonConvert.convert<int>(json['offset']);
  if (offset != null) {
    collectDataResponseData.offset = offset;
  }
  final bool? over = jsonConvert.convert<bool>(json['over']);
  if (over != null) {
    collectDataResponseData.over = over;
  }
  final int? pageCount = jsonConvert.convert<int>(json['pageCount']);
  if (pageCount != null) {
    collectDataResponseData.pageCount = pageCount;
  }
  final int? size = jsonConvert.convert<int>(json['size']);
  if (size != null) {
    collectDataResponseData.size = size;
  }
  final int? total = jsonConvert.convert<int>(json['total']);
  if (total != null) {
    collectDataResponseData.total = total;
  }
  return collectDataResponseData;
}

Map<String, dynamic> $CollectDataResponseDataToJson(
    CollectDataResponseData entity) {
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

CollectDataResponseDataDatas $CollectDataResponseDataDatasFromJson(
    Map<String, dynamic> json) {
  final CollectDataResponseDataDatas collectDataResponseDataDatas =
      CollectDataResponseDataDatas();
  final String? author = jsonConvert.convert<String>(json['author']);
  if (author != null) {
    collectDataResponseDataDatas.author = author;
  }
  final int? chapterId = jsonConvert.convert<int>(json['chapterId']);
  if (chapterId != null) {
    collectDataResponseDataDatas.chapterId = chapterId;
  }
  final String? chapterName = jsonConvert.convert<String>(json['chapterName']);
  if (chapterName != null) {
    collectDataResponseDataDatas.chapterName = chapterName;
  }
  final int? courseId = jsonConvert.convert<int>(json['courseId']);
  if (courseId != null) {
    collectDataResponseDataDatas.courseId = courseId;
  }
  final String? desc = jsonConvert.convert<String>(json['desc']);
  if (desc != null) {
    collectDataResponseDataDatas.desc = desc;
  }
  final String? envelopePic = jsonConvert.convert<String>(json['envelopePic']);
  if (envelopePic != null) {
    collectDataResponseDataDatas.envelopePic = envelopePic;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    collectDataResponseDataDatas.id = id;
  }
  final String? link = jsonConvert.convert<String>(json['link']);
  if (link != null) {
    collectDataResponseDataDatas.link = link;
  }
  final String? niceDate = jsonConvert.convert<String>(json['niceDate']);
  if (niceDate != null) {
    collectDataResponseDataDatas.niceDate = niceDate;
  }
  final String? origin = jsonConvert.convert<String>(json['origin']);
  if (origin != null) {
    collectDataResponseDataDatas.origin = origin;
  }
  final int? originId = jsonConvert.convert<int>(json['originId']);
  if (originId != null) {
    collectDataResponseDataDatas.originId = originId;
  }
  final int? publishTime = jsonConvert.convert<int>(json['publishTime']);
  if (publishTime != null) {
    collectDataResponseDataDatas.publishTime = publishTime;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    collectDataResponseDataDatas.title = title;
  }
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    collectDataResponseDataDatas.userId = userId;
  }
  final int? visible = jsonConvert.convert<int>(json['visible']);
  if (visible != null) {
    collectDataResponseDataDatas.visible = visible;
  }
  final int? zan = jsonConvert.convert<int>(json['zan']);
  if (zan != null) {
    collectDataResponseDataDatas.zan = zan;
  }
  final bool? collect = jsonConvert.convert<bool>(json['collect']);
  if (collect != null) {
    collectDataResponseDataDatas.collect = collect;
  }
  return collectDataResponseDataDatas;
}

Map<String, dynamic> $CollectDataResponseDataDatasToJson(
    CollectDataResponseDataDatas entity) {
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
  data['collect'] = entity.collect;
  return data;
}
