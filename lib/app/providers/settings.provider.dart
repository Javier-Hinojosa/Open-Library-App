import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';

class SettingsProvider extends ChangeNotifier{


  String _appVersion = '0.0';
  String get appVersion => _appVersion;

  String _packageName = '';
  String get packageName => _packageName;



  void getPackageInfo () async{
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    _appVersion = packageInfo.version;
    _packageName = packageInfo.packageName;
    notifyListeners();
    
  }
}