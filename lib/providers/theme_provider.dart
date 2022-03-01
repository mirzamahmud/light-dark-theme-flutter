import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier{

  String currentTheme = 'system';

  ThemeMode get themeMode {

    if(currentTheme == 'light'){

      return ThemeMode.light;
    }
    else if(currentTheme == 'dark'){

      return ThemeMode.dark;
    }
    else{

      return ThemeMode.system;
    }
  }

  changeTheme(String theme) async{

    final SharedPreferences _sharePref = await SharedPreferences.getInstance();
    await _sharePref.setString('theme', theme);

    currentTheme = theme;
    notifyListeners();
  }

  initialize() async{

    final SharedPreferences _sharePref = await SharedPreferences.getInstance();
    currentTheme = _sharePref.getString('theme') ?? 'system';
    notifyListeners();
  }
}