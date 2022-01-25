class BannerEntity {
  List<BannerData>? data;
  int? errorCode;
  String? errorMsg;

  BannerEntity({this.data, this.errorCode, this.errorMsg});

  BannerEntity.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <BannerData>[];
      (json['data'] as List).forEach((v) {
        data?.add(BannerData.fromJson(v));
      });
    }
    errorCode = json['errorCode'];
    errorMsg = json['errorMsg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data?.map((v) => v.toJson()).toList();
    }
    data['errorCode'] = errorCode;
    data['errorMsg'] = errorMsg;
    return data;
  }
}

class BannerData {
  String? imagePath;
  int? id;
  int? isVisible;
  String? title;
  int? type;
  String? url;
  String? desc;
  int? order;

  BannerData(
      {this.imagePath,
      this.id,
      this.isVisible,
      this.title,
      this.type,
      this.url,
      this.desc,
      this.order});

  BannerData.fromJson(Map<String, dynamic> json) {
    imagePath = json['imagePath'];
    id = json['id'];
    isVisible = json['isVisible'];
    title = json['title'];
    type = json['type'];
    url = json['url'];
    desc = json['desc'];
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['imagePath'] = imagePath;
    data['id'] = id;
    data['isVisible'] = isVisible;
    data['title'] = title;
    data['type'] = type;
    data['url'] = url;
    data['desc'] = desc;
    data['order'] = order;
    return data;
  }
}
