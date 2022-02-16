import 'package:flutter/cupertino.dart';
import 'package:flutter_study_github/model/user_entity.dart';

class UserInfo extends ChangeNotifier {
  UserEntity? _userEntity;
  UserInfo(this._userEntity);

  void setUserInfo(UserEntity userEntity) {
    _userEntity = userEntity;
    notifyListeners(); //2
  }

  get userEntity => _userEntity; //3

}
