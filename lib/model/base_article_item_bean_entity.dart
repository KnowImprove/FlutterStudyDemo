import 'dart:convert';

import 'package:flutter_study_github/generated/json/base/json_field.dart';
import 'package:flutter_study_github/generated/json/base_article_item_bean_entity.g.dart';

@JsonSerializable()
class BaseArticleItemBeanEntity {
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

  BaseArticleItemBeanEntity();

  factory BaseArticleItemBeanEntity.fromJson(Map<String, dynamic> json) =>
      $BaseArticleItemBeanEntityFromJson(json);

  Map<String, dynamic> toJson() => $BaseArticleItemBeanEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
