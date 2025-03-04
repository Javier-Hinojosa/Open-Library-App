import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';

class Globals {
  static const appName = 'Open Library';
  static const systemIcon="@mipmap/ic_launcher";
  static const int applicationId = 13;
  static const String iOSAppID = '1597508747';

  static const String currentLocale = 'es';
  static const String currentCountry = 'MX';
  static const String currentLocaleComplete = 'es_MX';

  static Color themeLight = Colors.grey[300]!;
  static Color themeDark = Colors.grey[850]!;

  static const Color primaryColor= Color(0xfff5b861);
  static const Color secondaryColor= Color(0xfffef6ea);

  static const Color backgroundColor =  Color(0xeee1dcc5);
  static const Color backgroundColorBlack = Colors.black54;

  static const String  extensionImageBook = "b/id";
  static const String  extensionImageAuthor = "a/olid";
  static const String  extensionJPG = ".jpg";
  static const String  letters = r'^[a-zA-ZÀ-ÿ\s]+$';
  static final List<String> alphabet = List.generate(26, (index) => String.fromCharCode(65 + index));

  static Map<String, MediaType> mimeTypes = {
    'txt': MediaType('text', 'plain'),
    'html': MediaType('text', 'html'),
    'json': MediaType('application', 'json'),
    'pdf': MediaType('application', 'pdf'),
    'jpg': MediaType('image', 'jpeg'),
    'jpeg': MediaType('image', 'jpeg'),
    'png': MediaType('image', 'png'),
    'gif': MediaType('image', 'gif'),
    'mp4': MediaType('video', 'mp4'),
    'avi': MediaType('video', 'x-msvideo'),
    'mp3': MediaType('audio', 'mpeg'),
    'wav': MediaType('audio', 'wav'),
  };

}
