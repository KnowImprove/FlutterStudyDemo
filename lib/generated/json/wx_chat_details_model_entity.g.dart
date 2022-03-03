import 'package:flutter_study_github/generated/json/base/json_convert_content.dart';
import 'package:flutter_study_github/model/wx_chat_details_model_entity.dart';

WxChatDetailsModelEntity $WxChatDetailsModelEntityFromJson(
    Map<String, dynamic> json) {
  final WxChatDetailsModelEntity wxChatDetailsModelEntity =
      WxChatDetailsModelEntity();
  final WxChatDetailsModelData? data =
      jsonConvert.convert<WxChatDetailsModelData>(json['data']);
  if (data != null) {
    wxChatDetailsModelEntity.data = data;
  }
  final int? errorCode = jsonConvert.convert<int>(json['errorCode']);
  if (errorCode != null) {
    wxChatDetailsModelEntity.errorCode = errorCode;
  }
  final String? errorMsg = jsonConvert.convert<String>(json['errorMsg']);
  if (errorMsg != null) {
    wxChatDetailsModelEntity.errorMsg = errorMsg;
  }
  return wxChatDetailsModelEntity;
}

Map<String, dynamic> $WxChatDetailsModelEntityToJson(
    WxChatDetailsModelEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['data'] = entity.data?.toJson();
  data['errorCode'] = entity.errorCode;
  data['errorMsg'] = entity.errorMsg;
  return data;
}

WxChatDetailsModelData $WxChatDetailsModelDataFromJson(
    Map<String, dynamic> json) {
  final WxChatDetailsModelData wxChatDetailsModelData =
      WxChatDetailsModelData();
  final int? curPage = jsonConvert.convert<int>(json['curPage']);
  if (curPage != null) {
    wxChatDetailsModelData.curPage = curPage;
  }
  final List<WxChatDetailsModelDataDatas>? datas = jsonConvert
      .convertListNotNull<WxChatDetailsModelDataDatas>(json['datas']);
  if (datas != null) {
    wxChatDetailsModelData.datas = datas;
  }
  final int? offset = jsonConvert.convert<int>(json['offset']);
  if (offset != null) {
    wxChatDetailsModelData.offset = offset;
  }
  final bool? over = jsonConvert.convert<bool>(json['over']);
  if (over != null) {
    wxChatDetailsModelData.over = over;
  }
  final int? pageCount = jsonConvert.convert<int>(json['pageCount']);
  if (pageCount != null) {
    wxChatDetailsModelData.pageCount = pageCount;
  }
  final int? size = jsonConvert.convert<int>(json['size']);
  if (size != null) {
    wxChatDetailsModelData.size = size;
  }
  final int? total = jsonConvert.convert<int>(json['total']);
  if (total != null) {
    wxChatDetailsModelData.total = total;
  }
  return wxChatDetailsModelData;
}

Map<String, dynamic> $WxChatDetailsModelDataToJson(
    WxChatDetailsModelData entity) {
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

WxChatDetailsModelDataDatas $WxChatDetailsModelDataDatasFromJson(
    Map<String, dynamic> json) {
  final WxChatDetailsModelDataDatas wxChatDetailsModelDataDatas =
      WxChatDetailsModelDataDatas();
  final String? apkLink = jsonConvert.convert<String>(json['apkLink']);
  if (apkLink != null) {
    wxChatDetailsModelDataDatas.apkLink = apkLink;
  }
  final int? audit = jsonConvert.convert<int>(json['audit']);
  if (audit != null) {
    wxChatDetailsModelDataDatas.audit = audit;
  }
  final String? author = jsonConvert.convert<String>(json['author']);
  if (author != null) {
    wxChatDetailsModelDataDatas.author = author;
  }
  final bool? canEdit = jsonConvert.convert<bool>(json['canEdit']);
  if (canEdit != null) {
    wxChatDetailsModelDataDatas.canEdit = canEdit;
  }
  final int? chapterId = jsonConvert.convert<int>(json['chapterId']);
  if (chapterId != null) {
    wxChatDetailsModelDataDatas.chapterId = chapterId;
  }
  final String? chapterName = jsonConvert.convert<String>(json['chapterName']);
  if (chapterName != null) {
    wxChatDetailsModelDataDatas.chapterName = chapterName;
  }
  final bool? collect = jsonConvert.convert<bool>(json['collect']);
  if (collect != null) {
    wxChatDetailsModelDataDatas.collect = collect;
  }
  final int? courseId = jsonConvert.convert<int>(json['courseId']);
  if (courseId != null) {
    wxChatDetailsModelDataDatas.courseId = courseId;
  }
  final String? desc = jsonConvert.convert<String>(json['desc']);
  if (desc != null) {
    wxChatDetailsModelDataDatas.desc = desc;
  }
  final String? descMd = jsonConvert.convert<String>(json['descMd']);
  if (descMd != null) {
    wxChatDetailsModelDataDatas.descMd = descMd;
  }
  final String? envelopePic = jsonConvert.convert<String>(json['envelopePic']);
  if (envelopePic != null) {
    wxChatDetailsModelDataDatas.envelopePic = envelopePic;
  }
  final bool? fresh = jsonConvert.convert<bool>(json['fresh']);
  if (fresh != null) {
    wxChatDetailsModelDataDatas.fresh = fresh;
  }
  final String? host = jsonConvert.convert<String>(json['host']);
  if (host != null) {
    wxChatDetailsModelDataDatas.host = host;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    wxChatDetailsModelDataDatas.id = id;
  }
  final String? link = jsonConvert.convert<String>(json['link']);
  if (link != null) {
    wxChatDetailsModelDataDatas.link = link;
  }
  final String? niceDate = jsonConvert.convert<String>(json['niceDate']);
  if (niceDate != null) {
    wxChatDetailsModelDataDatas.niceDate = niceDate;
  }
  final String? niceShareDate =
      jsonConvert.convert<String>(json['niceShareDate']);
  if (niceShareDate != null) {
    wxChatDetailsModelDataDatas.niceShareDate = niceShareDate;
  }
  final String? origin = jsonConvert.convert<String>(json['origin']);
  if (origin != null) {
    wxChatDetailsModelDataDatas.origin = origin;
  }
  final String? prefix = jsonConvert.convert<String>(json['prefix']);
  if (prefix != null) {
    wxChatDetailsModelDataDatas.prefix = prefix;
  }
  final String? projectLink = jsonConvert.convert<String>(json['projectLink']);
  if (projectLink != null) {
    wxChatDetailsModelDataDatas.projectLink = projectLink;
  }
  final int? publishTime = jsonConvert.convert<int>(json['publishTime']);
  if (publishTime != null) {
    wxChatDetailsModelDataDatas.publishTime = publishTime;
  }
  final int? realSuperChapterId =
      jsonConvert.convert<int>(json['realSuperChapterId']);
  if (realSuperChapterId != null) {
    wxChatDetailsModelDataDatas.realSuperChapterId = realSuperChapterId;
  }
  final int? selfVisible = jsonConvert.convert<int>(json['selfVisible']);
  if (selfVisible != null) {
    wxChatDetailsModelDataDatas.selfVisible = selfVisible;
  }
  final int? shareDate = jsonConvert.convert<int>(json['shareDate']);
  if (shareDate != null) {
    wxChatDetailsModelDataDatas.shareDate = shareDate;
  }
  final String? shareUser = jsonConvert.convert<String>(json['shareUser']);
  if (shareUser != null) {
    wxChatDetailsModelDataDatas.shareUser = shareUser;
  }
  final int? superChapterId = jsonConvert.convert<int>(json['superChapterId']);
  if (superChapterId != null) {
    wxChatDetailsModelDataDatas.superChapterId = superChapterId;
  }
  final String? superChapterName =
      jsonConvert.convert<String>(json['superChapterName']);
  if (superChapterName != null) {
    wxChatDetailsModelDataDatas.superChapterName = superChapterName;
  }
  final List<WxChatDetailsModelDataDatasTags>? tags = jsonConvert
      .convertListNotNull<WxChatDetailsModelDataDatasTags>(json['tags']);
  if (tags != null) {
    wxChatDetailsModelDataDatas.tags = tags;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    wxChatDetailsModelDataDatas.title = title;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    wxChatDetailsModelDataDatas.type = type;
  }
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    wxChatDetailsModelDataDatas.userId = userId;
  }
  final int? visible = jsonConvert.convert<int>(json['visible']);
  if (visible != null) {
    wxChatDetailsModelDataDatas.visible = visible;
  }
  final int? zan = jsonConvert.convert<int>(json['zan']);
  if (zan != null) {
    wxChatDetailsModelDataDatas.zan = zan;
  }
  return wxChatDetailsModelDataDatas;
}

Map<String, dynamic> $WxChatDetailsModelDataDatasToJson(
    WxChatDetailsModelDataDatas entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['apkLink'] = entity.apkLink;
  data['audit'] = entity.audit;
  data['author'] = entity.author;
  data['canEdit'] = entity.canEdit;
  data['chapterId'] = entity.chapterId;
  data['chapterName'] = entity.chapterName;
  data['collect'] = entity.collect;
  data['courseId'] = entity.courseId;
  data['desc'] = entity.desc;
  data['descMd'] = entity.descMd;
  data['envelopePic'] = entity.envelopePic;
  data['fresh'] = entity.fresh;
  data['host'] = entity.host;
  data['id'] = entity.id;
  data['link'] = entity.link;
  data['niceDate'] = entity.niceDate;
  data['niceShareDate'] = entity.niceShareDate;
  data['origin'] = entity.origin;
  data['prefix'] = entity.prefix;
  data['projectLink'] = entity.projectLink;
  data['publishTime'] = entity.publishTime;
  data['realSuperChapterId'] = entity.realSuperChapterId;
  data['selfVisible'] = entity.selfVisible;
  data['shareDate'] = entity.shareDate;
  data['shareUser'] = entity.shareUser;
  data['superChapterId'] = entity.superChapterId;
  data['superChapterName'] = entity.superChapterName;
  data['tags'] = entity.tags?.map((v) => v.toJson()).toList();
  data['title'] = entity.title;
  data['type'] = entity.type;
  data['userId'] = entity.userId;
  data['visible'] = entity.visible;
  data['zan'] = entity.zan;
  return data;
}

WxChatDetailsModelDataDatasTags $WxChatDetailsModelDataDatasTagsFromJson(
    Map<String, dynamic> json) {
  final WxChatDetailsModelDataDatasTags wxChatDetailsModelDataDatasTags =
      WxChatDetailsModelDataDatasTags();
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    wxChatDetailsModelDataDatasTags.name = name;
  }
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    wxChatDetailsModelDataDatasTags.url = url;
  }
  return wxChatDetailsModelDataDatasTags;
}

Map<String, dynamic> $WxChatDetailsModelDataDatasTagsToJson(
    WxChatDetailsModelDataDatasTags entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['name'] = entity.name;
  data['url'] = entity.url;
  return data;
}
