// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:flutter_study_github/model/banner_model_entity.dart';
import 'package:flutter_study_github/model/base_article_item_bean_entity.dart';
import 'package:flutter_study_github/model/collect_list_response_model_entity.dart';
import 'package:flutter_study_github/model/project_model_item_entity.dart';
import 'package:flutter_study_github/model/project_title_tab_model_entity.dart';
import 'package:flutter_study_github/model/seach_hot_key_model_entity.dart';
import 'package:flutter_study_github/model/search_key_result_model_entity.dart';
import 'package:flutter_study_github/model/wx_chat_details_model_entity.dart';
import 'package:flutter_study_github/model/wx_tab_title_model_entity.dart';

JsonConvert jsonConvert = JsonConvert();

class JsonConvert {
  T? convert<T>(dynamic value) {
    if (value == null) {
      return null;
    }
    return asT<T>(value);
  }

  List<T?>? convertList<T>(List<dynamic>? value) {
    if (value == null) {
      return null;
    }
    try {
      return value.map((dynamic e) => asT<T>(e)).toList();
    } catch (e, stackTrace) {
      print('asT<$T> $e $stackTrace');
      return <T>[];
    }
  }

  List<T>? convertListNotNull<T>(dynamic value) {
    if (value == null) {
      return null;
    }
    try {
      return (value as List<dynamic>).map((dynamic e) => asT<T>(e)!).toList();
    } catch (e, stackTrace) {
      print('asT<$T> $e $stackTrace');
      return <T>[];
    }
  }

  T? asT<T extends Object?>(dynamic value) {
    if (value is T) {
      return value;
    }
    final String type = T.toString();
    try {
      final String valueS = value.toString();
      if (type == "String") {
        return valueS as T;
      } else if (type == "int") {
        final int? intValue = int.tryParse(valueS);
        if (intValue == null) {
          return double.tryParse(valueS)?.toInt() as T?;
        } else {
          return intValue as T;
        }
      } else if (type == "double") {
        return double.parse(valueS) as T;
      } else if (type == "DateTime") {
        return DateTime.parse(valueS) as T;
      } else if (type == "bool") {
        if (valueS == '0' || valueS == '1') {
          return (valueS == '1') as T;
        }
        return (valueS == 'true') as T;
      } else {
        return JsonConvert.fromJsonAsT<T>(value);
      }
    } catch (e, stackTrace) {
      print('asT<$T> $e $stackTrace');
      return null;
    }
  }

  //Go back to a single instance by type
  static M? _fromJsonSingle<M>(Map<String, dynamic> json) {
    final String type = M.toString();
    if (type == (BannerModelEntity).toString()) {
      return BannerModelEntity.fromJson(json) as M;
    }
    if (type == (BannerModelData).toString()) {
      return BannerModelData.fromJson(json) as M;
    }
    if (type == (BaseArticleItemBeanEntity).toString()) {
      return BaseArticleItemBeanEntity.fromJson(json) as M;
    }
    if (type == (CollectListResponseModelEntity).toString()) {
      return CollectListResponseModelEntity.fromJson(json) as M;
    }
    if (type == (CollectListResponseModelData).toString()) {
      return CollectListResponseModelData.fromJson(json) as M;
    }
    if (type == (CollectListResponseModelDataDatas).toString()) {
      return CollectListResponseModelDataDatas.fromJson(json) as M;
    }
    if (type == (ProjectModelItemEntity).toString()) {
      return ProjectModelItemEntity.fromJson(json) as M;
    }
    if (type == (ProjectModelItemData).toString()) {
      return ProjectModelItemData.fromJson(json) as M;
    }
    if (type == (ProjectModelItemDataDatas).toString()) {
      return ProjectModelItemDataDatas.fromJson(json) as M;
    }
    if (type == (ProjectModelItemDataDatasTags).toString()) {
      return ProjectModelItemDataDatasTags.fromJson(json) as M;
    }
    if (type == (ProjectTitleTabModelEntity).toString()) {
      return ProjectTitleTabModelEntity.fromJson(json) as M;
    }
    if (type == (ProjectTitleTabModelData).toString()) {
      return ProjectTitleTabModelData.fromJson(json) as M;
    }
    if (type == (SeachHotKeyModelEntity).toString()) {
      return SeachHotKeyModelEntity.fromJson(json) as M;
    }
    if (type == (SeachHotKeyModelData).toString()) {
      return SeachHotKeyModelData.fromJson(json) as M;
    }
    if (type == (SearchKeyResultModelEntity).toString()) {
      return SearchKeyResultModelEntity.fromJson(json) as M;
    }
    if (type == (SearchKeyResultModelData).toString()) {
      return SearchKeyResultModelData.fromJson(json) as M;
    }
    if (type == (SearchKeyResultModelDataDatas).toString()) {
      return SearchKeyResultModelDataDatas.fromJson(json) as M;
    }
    if (type == (WxChatDetailsModelEntity).toString()) {
      return WxChatDetailsModelEntity.fromJson(json) as M;
    }
    if (type == (WxChatDetailsModelData).toString()) {
      return WxChatDetailsModelData.fromJson(json) as M;
    }
    if (type == (WxChatDetailsModelDataDatas).toString()) {
      return WxChatDetailsModelDataDatas.fromJson(json) as M;
    }
    if (type == (WxChatDetailsModelDataDatasTags).toString()) {
      return WxChatDetailsModelDataDatasTags.fromJson(json) as M;
    }
    if (type == (WxTabTitleModelEntity).toString()) {
      return WxTabTitleModelEntity.fromJson(json) as M;
    }
    if (type == (WxTabTitleModelData).toString()) {
      return WxTabTitleModelData.fromJson(json) as M;
    }

    print("$type not found");

    return null;
  }

  //list is returned by type
  static M? _getListChildType<M>(List<Map<String, dynamic>> data) {
    if (<BannerModelEntity>[] is M) {
      return data
          .map<BannerModelEntity>(
              (Map<String, dynamic> e) => BannerModelEntity.fromJson(e))
          .toList() as M;
    }
    if (<BannerModelData>[] is M) {
      return data
          .map<BannerModelData>(
              (Map<String, dynamic> e) => BannerModelData.fromJson(e))
          .toList() as M;
    }
    if (<BaseArticleItemBeanEntity>[] is M) {
      return data
          .map<BaseArticleItemBeanEntity>(
              (Map<String, dynamic> e) => BaseArticleItemBeanEntity.fromJson(e))
          .toList() as M;
    }
    if (<CollectListResponseModelEntity>[] is M) {
      return data
          .map<CollectListResponseModelEntity>((Map<String, dynamic> e) =>
              CollectListResponseModelEntity.fromJson(e))
          .toList() as M;
    }
    if (<CollectListResponseModelData>[] is M) {
      return data
          .map<CollectListResponseModelData>((Map<String, dynamic> e) =>
              CollectListResponseModelData.fromJson(e))
          .toList() as M;
    }
    if (<CollectListResponseModelDataDatas>[] is M) {
      return data
          .map<CollectListResponseModelDataDatas>((Map<String, dynamic> e) =>
              CollectListResponseModelDataDatas.fromJson(e))
          .toList() as M;
    }
    if (<ProjectModelItemEntity>[] is M) {
      return data
          .map<ProjectModelItemEntity>(
              (Map<String, dynamic> e) => ProjectModelItemEntity.fromJson(e))
          .toList() as M;
    }
    if (<ProjectModelItemData>[] is M) {
      return data
          .map<ProjectModelItemData>(
              (Map<String, dynamic> e) => ProjectModelItemData.fromJson(e))
          .toList() as M;
    }
    if (<ProjectModelItemDataDatas>[] is M) {
      return data
          .map<ProjectModelItemDataDatas>(
              (Map<String, dynamic> e) => ProjectModelItemDataDatas.fromJson(e))
          .toList() as M;
    }
    if (<ProjectModelItemDataDatasTags>[] is M) {
      return data
          .map<ProjectModelItemDataDatasTags>((Map<String, dynamic> e) =>
              ProjectModelItemDataDatasTags.fromJson(e))
          .toList() as M;
    }
    if (<ProjectTitleTabModelEntity>[] is M) {
      return data
          .map<ProjectTitleTabModelEntity>((Map<String, dynamic> e) =>
              ProjectTitleTabModelEntity.fromJson(e))
          .toList() as M;
    }
    if (<ProjectTitleTabModelData>[] is M) {
      return data
          .map<ProjectTitleTabModelData>(
              (Map<String, dynamic> e) => ProjectTitleTabModelData.fromJson(e))
          .toList() as M;
    }
    if (<SeachHotKeyModelEntity>[] is M) {
      return data
          .map<SeachHotKeyModelEntity>(
              (Map<String, dynamic> e) => SeachHotKeyModelEntity.fromJson(e))
          .toList() as M;
    }
    if (<SeachHotKeyModelData>[] is M) {
      return data
          .map<SeachHotKeyModelData>(
              (Map<String, dynamic> e) => SeachHotKeyModelData.fromJson(e))
          .toList() as M;
    }
    if (<SearchKeyResultModelEntity>[] is M) {
      return data
          .map<SearchKeyResultModelEntity>((Map<String, dynamic> e) =>
              SearchKeyResultModelEntity.fromJson(e))
          .toList() as M;
    }
    if (<SearchKeyResultModelData>[] is M) {
      return data
          .map<SearchKeyResultModelData>(
              (Map<String, dynamic> e) => SearchKeyResultModelData.fromJson(e))
          .toList() as M;
    }
    if (<SearchKeyResultModelDataDatas>[] is M) {
      return data
          .map<SearchKeyResultModelDataDatas>((Map<String, dynamic> e) =>
              SearchKeyResultModelDataDatas.fromJson(e))
          .toList() as M;
    }
    if (<WxChatDetailsModelEntity>[] is M) {
      return data
          .map<WxChatDetailsModelEntity>(
              (Map<String, dynamic> e) => WxChatDetailsModelEntity.fromJson(e))
          .toList() as M;
    }
    if (<WxChatDetailsModelData>[] is M) {
      return data
          .map<WxChatDetailsModelData>(
              (Map<String, dynamic> e) => WxChatDetailsModelData.fromJson(e))
          .toList() as M;
    }
    if (<WxChatDetailsModelDataDatas>[] is M) {
      return data
          .map<WxChatDetailsModelDataDatas>((Map<String, dynamic> e) =>
              WxChatDetailsModelDataDatas.fromJson(e))
          .toList() as M;
    }
    if (<WxChatDetailsModelDataDatasTags>[] is M) {
      return data
          .map<WxChatDetailsModelDataDatasTags>((Map<String, dynamic> e) =>
              WxChatDetailsModelDataDatasTags.fromJson(e))
          .toList() as M;
    }
    if (<WxTabTitleModelEntity>[] is M) {
      return data
          .map<WxTabTitleModelEntity>(
              (Map<String, dynamic> e) => WxTabTitleModelEntity.fromJson(e))
          .toList() as M;
    }
    if (<WxTabTitleModelData>[] is M) {
      return data
          .map<WxTabTitleModelData>(
              (Map<String, dynamic> e) => WxTabTitleModelData.fromJson(e))
          .toList() as M;
    }

    print("${M.toString()} not found");

    return null;
  }

  static M? fromJsonAsT<M>(dynamic json) {
    if (json == null) {
      return null;
    }
    if (json is List) {
      return _getListChildType<M>(json as List<Map<String, dynamic>>);
    } else {
      return _fromJsonSingle<M>(json as Map<String, dynamic>);
    }
  }
}
