import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:open_library/data/services/app/app.contract.dart';
import 'package:open_library/data/services/base.service.dart';

class AppApiService extends BaseService implements IAppService {


  @override
  Future<bool> checkInternet() async {
    bool internet=false;
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        debugPrint('connected');
        internet = true;
      }
    } on SocketException catch (_) {
      debugPrint('not connected');
      internet = false;
    }
    return internet;
  }

}
