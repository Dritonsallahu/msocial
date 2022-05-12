import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeSettings extends ChangeNotifier{

  bool themeLoading = true;
  bool isDarkTheme = false;

  Future<bool?> initThemeMode() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    changeThemeStatus();
    return pref.getBool("m_social_theme_mode");

  }

  isBlackTheme(){
    return isDarkTheme;
  }

  checkThemeStatus(){
    return themeLoading;
  }


  changeThemeStatus(){
    themeLoading = false;
    notifyListeners();
  }

}