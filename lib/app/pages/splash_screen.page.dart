import 'package:flutter/material.dart';
import 'package:open_library/app/providers/splash.provider.dart';
import 'package:open_library/app/services/navigation.service.dart';
import 'package:open_library/core/routes/routes.dart';
import 'package:open_library/core/values/paths.dart';
import 'package:provider/provider.dart';

class SplashScreenPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<SplashProvider>(
          builder: (context, splashProvider, child) {
            Future.delayed(Duration(seconds: 2), () {
              NavigationService.navigateReplacementTo(Routes.home);
            });
            return Image(
                height: 240,
                width: 240,
                fit: BoxFit.contain,
                image: AssetImage(Paths.logo)
            );
          })));
  }

}