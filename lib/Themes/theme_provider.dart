
import 'package:chat_app/Themes/dark_theme.dart';
import 'package:chat_app/Themes/light_theme.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{

  ThemeData _themeData = lightTheme;

  ThemeData get themeData => _themeData;

  bool get isdark => _themeData == darkTheme;

  set themeData(ThemeData themeData){
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme(){
    if(_themeData == lightTheme){
      themeData = darkTheme;
    }else{
      themeData = lightTheme;
    }
  }
}