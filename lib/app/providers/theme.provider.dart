import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:open_library/core/values/keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier{

  SharedPreferences? _pref;
  bool? _darkTheme;

  bool? get darkTheme => _darkTheme;

  ThemeProvider() {
    _darkTheme = false;
    _loadFromPrefs();
  }

  toggleTheme(){
    _darkTheme = !_darkTheme!;
    _saveToPrefs();
    notifyListeners();
  }

  _initPrefs() async {
    if(_pref == null)
      _pref  = await SharedPreferences.getInstance();
  }

  _loadFromPrefs() async {
      await _initPrefs();
      _darkTheme = _pref!.getBool(Keys.themeUse) ?? false;
      notifyListeners();
  }
  
  _saveToPrefs() async {
    await _initPrefs();
    _pref!.setBool(Keys.themeUse, _darkTheme!);
  }

}
