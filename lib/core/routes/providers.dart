import 'package:open_library/app/providers/book_detail.provider.dart';
import 'package:open_library/app/providers/home.provider.dart';
import 'package:open_library/app/providers/person.provider.dart';
import 'package:open_library/app/providers/register_person.provider.dart';
import 'package:open_library/app/providers/search.provider.dart';
import 'package:open_library/app/providers/settings.provider.dart';
import 'package:open_library/app/providers/splash.provider.dart';
import 'package:open_library/data/services/book/book.service.dart';
import 'package:open_library/data/services/person/person.service.dart';
import 'package:open_library/data/services/search/search.service.dart';
import 'package:provider/provider.dart';

abstract class Providers {

  static final searchApiService = SearchApiService();
  static final bookApiService = BookApiService();
  static final personApiService = PersonApiService();

  static final providers = [
    ChangeNotifierProvider<SplashProvider>(create: (_) => SplashProvider()),
    ChangeNotifierProvider<SettingsProvider>(create: (_) => SettingsProvider()),
    ChangeNotifierProvider<SearchProvider>(create: (_) => SearchProvider(searchApiService)),
    ChangeNotifierProvider<HomeProvider>(create: (_) => HomeProvider(searchApiService)),
    ChangeNotifierProvider<BookDetailProvider>(create: (_) => BookDetailProvider(bookApiService)),
    ChangeNotifierProvider<PersonsProvider>(create: (_) => PersonsProvider(personApiService)),
    ChangeNotifierProvider<RegisterPersonProvider>(create: (_) => RegisterPersonProvider(personApiService)),
  ];

}