import 'package:flutter/material.dart';
import 'package:open_library/app/pages/book_detail.page.dart';
import 'package:open_library/app/pages/home.page.dart';
import 'package:open_library/app/pages/persons.page.dart';
import 'package:open_library/app/pages/register_person.page.dart';
import 'package:open_library/app/pages/splash_screen.page.dart';
import 'package:open_library/core/routes/routes.dart';

Map<String, Widget Function(BuildContext)> pages = {
  Routes.splash : (context) => SplashScreenPage(),
  Routes.home : (context) => HomePage(),
  Routes.bookDetail : (context) => BookDetailPage(),
  Routes.persons : (context) => PersonsPage(),
  Routes.registerPerson : (context) => RegisterPersonPage(),
};