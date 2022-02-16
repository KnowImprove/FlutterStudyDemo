class UserEntity {
  UserData? data;
  int? errorCode;
  String? errorMsg;

  UserEntity({this.data, this.errorCode, this.errorMsg});

  UserEntity.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? UserData.fromJson(json['data']) : null;
    errorCode = json['errorCode'];
    errorMsg = json['errorMsg'];
  }

  UserEntity.fromJsonPro(Map<dynamic, dynamic> json) {
    data = json['data'] != null ? UserData.fromJson(json['data']) : null;
    errorCode = json['errorCode'];
    errorMsg = json['errorMsg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data?.toJson();
    }
    data['errorCode'] = errorCode;
    data['errorMsg'] = errorMsg;
    return data;
  }
}

class UserData {
  String? password;
  List<Null>? chapterTops;
  String? icon;
  bool? admin;
  List<int>? collectIds;
  int? id;
  int? type;
  String? email;
  String? token;
  String? username;

  UserData(
      {this.password,
      this.chapterTops,
      this.icon,
      this.admin,
      this.collectIds,
      this.id,
      this.type,
      this.email,
      this.token,
      this.username});

  UserData.fromJson(Map<String, dynamic> json) {
    password = json['password'];
    if (json['chapterTops'] != null) {
      chapterTops = <Null>[];
    }
    icon = json['icon'];
    admin = json['admin'];
    collectIds = json['collectIds']?.cast<int>();
    id = json['id'];
    type = json['type'];
    email = json['email'];
    token = json['token'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['password'] = password;
    if (chapterTops != null) {
      data['chapterTops'] = [];
    }
    data['icon'] = icon;
    data['admin'] = admin;
    data['collectIds'] = collectIds;
    data['id'] = id;
    data['type'] = type;
    data['email'] = email;
    data['token'] = token;
    data['username'] = username;
    return data;
  }
}
