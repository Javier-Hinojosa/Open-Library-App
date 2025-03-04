import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_library/core/values/globals.dart';
import 'app.dart';
import 'package:intl/date_symbol_data_local.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting(Globals.currentLocaleComplete, null);
  
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));

  SystemChrome.setPreferredOrientations([ //only vertical orientation
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) => runApp(MyApp()));
}


