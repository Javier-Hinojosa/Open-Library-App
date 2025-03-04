import 'package:flutter/material.dart';
import 'package:gif/gif.dart';
import 'package:open_library/core/values/paths.dart';

class LoadingScreen extends StatefulWidget {

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> with TickerProviderStateMixin {

  late final GifController _gifController;

  @override
  void initState() {
    super.initState();
    _gifController = GifController(vsync: this);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _gifController.repeat(period: Duration(seconds: 2));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).scaffoldBackgroundColor,
        child: Center(
        child: Gif(
            image: AssetImage(Paths.loading_books),
            controller: _gifController,
            height: 150,
            width: 150)));
  }

  @override
  void dispose() {
    _gifController.dispose();
    super.dispose();
  }

}