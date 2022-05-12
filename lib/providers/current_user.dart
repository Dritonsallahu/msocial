import 'package:flutter/foundation.dart';
import 'package:msocial/Model/user_model.dart';

class CurrentUser extends ChangeNotifier{
  UserModel? _userModel;


  UserModel? getUserModel(){
    return _userModel;
  }

  newUserModel(UserModel userModel){
    _userModel = _userModel;
    notifyListeners();
  }

}