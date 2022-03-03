import 'package:flutter_study_github/generated/json/base/json_convert_content.dart';
import 'package:flutter_study_github/model/project_model_item_entity.dart';

ProjectModelItemEntity $ProjectModelItemEntityFromJson(
    Map<String, dynamic> json) {
  final ProjectModelItemEntity projectModelItemEntity =
      ProjectModelItemEntity();
  final ProjectModelItemData? data =
      jsonConvert.convert<ProjectModelItemData>(json['data']);
  if (data != null) {
    projectModelItemEntity.data = data;
  }
  final int? errorCode = jsonConvert.convert<int>(json['errorCode']);
  if (errorCode != null) {
    projectModelItemEntity.errorCode = errorCode;
  }
  final String? errorMsg = jsonConvert.convert<String>(json['errorMsg']);
  if (errorMsg != null) {
    projectModelItemEntity.errorMsg = errorMsg;
  }
  return projectModelItemEntity;
}

Map<String, dynamic> $ProjectModelItemEntityToJson(
    ProjectModelItemEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['data'] = entity.data?.toJson();
  data['errorCode'] = entity.errorCode;
  data['errorMsg'] = entity.errorMsg;
  return data;
}

ProjectModelItemData $ProjectModelItemDataFromJson(Map<String, dynamic> json) {
  final ProjectModelItemData projectModelItemData = ProjectModelItemData();
  final int? curPage = jsonConvert.convert<int>(json['curPage']);
  if (curPage != null) {
    projectModelItemData.curPage = curPage;
  }
  final List<ProjectModelItemDataDatas>? datas =
      jsonConvert.convertListNotNull<ProjectModelItemDataDatas>(json['datas']);
  if (datas != null) {
    projectModelItemData.datas = datas;
  }
  final int? offset = jsonConvert.convert<int>(json['offset']);
  if (offset != null) {
    projectModelItemData.offset = offset;
  }
  final bool? over = jsonConvert.convert<bool>(json['over']);
  if (over != null) {
    projectModelItemData.over = over;
  }
  final int? pageCount = jsonConvert.convert<int>(json['pageCount']);
  if (pageCount != null) {
    projectModelItemData.pageCount = pageCount;
  }
  final int? size = jsonConvert.convert<int>(json['size']);
  if (size != null) {
    projectModelItemData.size = size;
  }
  final int? total = jsonConvert.convert<int>(json['total']);
  if (total != null) {
    projectModelItemData.total = total;
  }
  return projectModelItemData;
}

Map<String, dynamic> $ProjectModelItemDataToJson(ProjectModelItemData entity) {
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

ProjectModelItemDataDatas $ProjectModelItemDataDatasFromJson(
    Map<String, dynamic> json) {
  final ProjectModelItemDataDatas projectModelItemDataDatas =
      ProjectModelItemDataDatas();
  final String? apkLink = jsonConvert.convert<String>(json['apkLink']);
  if (apkLink != null) {
    projectModelItemDataDatas.apkLink = apkLink;
  }
  final int? audit = jsonConvert.convert<int>(json['audit']);
  if (audit != null) {
    projectModelItemDataDatas.audit = audit;
  }
  final String? author = jsonConvert.convert<String>(json['author']);
  if (author != null) {
    projectModelItemDataDatas.author = author;
  }
  final bool? canEdit = jsonConvert.convert<bool>(json['canEdit']);
  if (canEdit != null) {
    projectModelItemDataDatas.canEdit = canEdit;
  }
  final int? chapterId = jsonConvert.convert<int>(json['chapterId']);
  if (chapterId != null) {
    projectModelItemDataDatas.chapterId = chapterId;
  }
  final String? chapterName = jsonConvert.convert<String>(json['chapterName']);
  if (chapterName != null) {
    projectModelItemDataDatas.chapterName = chapterName;
  }
  final bool? collect = jsonConvert.convert<bool>(json['collect']);
  if (collect != null) {
    projectModelItemDataDatas.collect = collect;
  }
  final int? courseId = jsonConvert.convert<int>(json['courseId']);
  if (courseId != null) {
    projectModelItemDataDatas.courseId = courseId;
  }
  final String? desc = jsonConvert.convert<String>(json['desc']);
  if (desc != null) {
    projectModelItemDataDatas.desc = desc;
  }
  final String? descMd = jsonConvert.convert<String>(json['descMd']);
  if (descMd != null) {
    projectModelItemDataDatas.descMd = descMd;
  }
  final String? envelopePic = jsonConvert.convert<String>(json['envelopePic']);
  if (envelopePic != null) {
    projectModelItemDataDatas.envelopePic = envelopePic;
  }
  final bool? fresh = jsonConvert.convert<bool>(json['fresh']);
  if (fresh != null) {
    projectModelItemDataDatas.fresh = fresh;
  }
  final String? host = jsonConvert.convert<String>(json['host']);
  if (host != null) {
    projectModelItemDataDatas.host = host;
  }
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    projectModelItemDataDatas.id = id;
  }
  final String? link = jsonConvert.convert<String>(json['link']);
  if (link != null) {
    projectModelItemDataDatas.link = link;
  }
  final String? niceDate = jsonConvert.convert<String>(json['niceDate']);
  if (niceDate != null) {
    projectModelItemDataDatas.niceDate = niceDate;
  }
  final String? niceShareDate =
      jsonConvert.convert<String>(json['niceShareDate']);
  if (niceShareDate != null) {
    projectModelItemDataDatas.niceShareDate = niceShareDate;
  }
  final String? origin = jsonConvert.convert<String>(json['origin']);
  if (origin != null) {
    projectModelItemDataDatas.origin = origin;
  }
  final String? prefix = jsonConvert.convert<String>(json['prefix']);
  if (prefix != null) {
    projectModelItemDataDatas.prefix = prefix;
  }
  final String? projectLink = jsonConvert.convert<String>(json['projectLink']);
  if (projectLink != null) {
    projectModelItemDataDatas.projectLink = projectLink;
  }
  final int? publishTime = jsonConvert.convert<int>(json['publishTime']);
  if (publishTime != null) {
    projectModelItemDataDatas.publishTime = publishTime;
  }
  final int? realSuperChapterId =
      jsonConvert.convert<int>(json['realSuperChapterId']);
  if (realSuperChapterId != null) {
    projectModelItemDataDatas.realSuperChapterId = realSuperChapterId;
  }
  final int? selfVisible = jsonConvert.convert<int>(json['selfVisible']);
  if (selfVisible != null) {
    projectModelItemDataDatas.selfVisible = selfVisible;
  }
  final int? shareDate = jsonConvert.convert<int>(json['shareDate']);
  if (shareDate != null) {
    projectModelItemDataDatas.shareDate = shareDate;
  }
  final String? shareUser = jsonConvert.convert<String>(json['shareUser']);
  if (shareUser != null) {
    projectModelItemDataDatas.shareUser = shareUser;
  }
  final int? superChapterId = jsonConvert.convert<int>(json['superChapterId']);
  if (superChapterId != null) {
    projectModelItemDataDatas.superChapterId = superChapterId;
  }
  final String? superChapterName =
      jsonConvert.convert<String>(json['superChapterName']);
  if (superChapterName != null) {
    projectModelItemDataDatas.superChapterName = superChapterName;
  }
  final List<ProjectModelItemDataDatasTags>? tags = jsonConvert
      .convertListNotNull<ProjectModelItemDataDatasTags>(json['tags']);
  if (tags != null) {
    projectModelItemDataDatas.tags = tags;
  }
  final String? title = jsonConvert.convert<String>(json['title']);
  if (title != null) {
    projectModelItemDataDatas.title = title;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    projectModelItemDataDatas.type = type;
  }
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    projectModelItemDataDatas.userId = userId;
  }
  final int? visible = jsonConvert.convert<int>(json['visible']);
  if (visible != null) {
    projectModelItemDataDatas.visible = visible;
  }
  final int? zan = jsonConvert.convert<int>(json['zan']);
  if (zan != null) {
    projectModelItemDataDatas.zan = zan;
  }
  return projectModelItemDataDatas;
}

Map<String, dynamic> $ProjectModelItemDataDatasToJson(
    ProjectModelItemDataDatas entity) {
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

ProjectModelItemDataDatasTags $ProjectModelItemDataDatasTagsFromJson(
    Map<String, dynamic> json) {
  final ProjectModelItemDataDatasTags projectModelItemDataDatasTags =
      ProjectModelItemDataDatasTags();
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    projectModelItemDataDatasTags.name = name;
  }
  final String? url = jsonConvert.convert<String>(json['url']);
  if (url != null) {
    projectModelItemDataDatasTags.url = url;
  }
  return projectModelItemDataDatasTags;
}

Map<String, dynamic> $ProjectModelItemDataDatasTagsToJson(
    ProjectModelItemDataDatasTags entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['name'] = entity.name;
  data['url'] = entity.url;
  return data;
}
