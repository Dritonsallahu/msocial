import 'package:flutter/cupertino.dart';
import 'package:msocial/Animacionet/slide_right_route.dart';
import 'package:msocial/Model/user_model.dart';
import 'package:msocial/providers/current_user.dart';
import 'package:msocial/widgets/main_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AutoLogin {
  String appName = "MSOCIAL";
  Future<bool?> checkLoginStatus() async{
    SharedPreferences getData = await SharedPreferences.getInstance();
    return getData.getBool("$appName-logged");
  }

  saveNewUser(UserModel userModel,context) async {
    SharedPreferences saveData = await SharedPreferences.getInstance();
    saveData.setBool("$appName-logged", true);
    saveData.setString("$appName-registration_id", userModel.registration_id!);
    saveData.setString("$appName-reg_unik_id", userModel.reg_unik_id!);
    saveData.setString("$appName-first_name", userModel.first_name!);
    saveData.setString("$appName-middle_name", userModel.middle_name!);
    saveData.setString("$appName-last_name", userModel.last_name!);
    saveData.setString("$appName-username", userModel.username!);
    saveData.setString("$appName-email", userModel.email!);
    saveData.setString("$appName-registered_date", userModel.registered_date!);
    saveData.setString("$appName-ip_address", userModel.ip_address!);
    saveData.setString("$appName-gender", userModel.gender!);
    saveData.setString("$appName-country", userModel.country!);
    saveData.setString("$appName-city", userModel.city!);
    saveData.setString("$appName-address", userModel.address!);
    saveData.setString("$appName-religion", userModel.religion!);
    saveData.setString("$appName-isActivated", userModel.isActivated!);
    saveData.setString("$appName-registrationStep", userModel.registrationStep!);
    saveData.setString("$appName-userStatus", userModel.userStatus!);



    Navigator.of(context).pushReplacement(SlideRightRoute(page: const MainPage()));
  }
  deleteUser() async{
    SharedPreferences saveData = await SharedPreferences.getInstance();
    saveData.setBool("$appName-logged", false);
    saveData.setString("$appName-registration_id", "");
    saveData.setString("$appName-reg_unik_id", "");
    saveData.setString("$appName-first_name", "");
    saveData.setString("$appName-middle_name", "");
    saveData.setString("$appName-last_name", "");
    saveData.setString("$appName-username", "");
    saveData.setString("$appName-email", "");
    saveData.setString("$appName-registered_date", "");
    saveData.setString("$appName-ip_address", "");
    saveData.setString("$appName-gender", "");
    saveData.setString("$appName-country", "");
    saveData.setString("$appName-city","");
    saveData.setString("$appName-address", "");
    saveData.setString("$appName-religion", "");
    saveData.setString("$appName-isActivated", "");
    saveData.setString("$appName-registrationStep", "");
    saveData.setString("$appName-userStatus", "");
  }

  Future<void> buildCurrentUserData(context) async {

    var userProvider = Provider.of<CurrentUser>(context,listen: false);
    SharedPreferences saveData = await SharedPreferences.getInstance();
    saveData.getBool("$appName-logged");
    UserModel userModel = UserModel();
    userModel.registration_id  = saveData.getString("$appName-registration_id");
    userModel.reg_unik_id  = saveData.getString("$appName-reg_unik_id");
    userModel.first_name  = saveData.getString("$appName-first_name");
    userModel.middle_name  = saveData.getString("$appName-middle_name");
    userModel.last_name  = saveData.getString("$appName-last_name");
    userModel.username  = saveData.getString("$appName-username");
    userModel.email  = saveData.getString("$appName-email");
    userModel.registered_date  = saveData.getString("$appName-registered_date");
    userModel.ip_address  = saveData.getString("$appName-ip_address");
    userModel.gender  = saveData.getString("$appName-gender");
    userModel.country  = saveData.getString("$appName-country");
    userModel.city  = saveData.getString("$appName-city");
    userModel.address  = saveData.getString("$appName-address");
    userModel.religion  = saveData.getString("$appName-religion");
    userModel.isActivated  = saveData.getString("$appName-isActivated");
    userModel.registrationStep  = saveData.getString("$appName-registrationStep");
    userModel.userStatus  = saveData.getString("$appName-userStatus");
    userProvider.newUserModel(userModel);
  }


}
