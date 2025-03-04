import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:open_library/app/services/navigation.service.dart';



class SnackBarUtils {
  static void success(BuildContext context,String? message,
      {title = 'Operación correcta'}) =>
      _showTopSnackBar(context, message!, title, colorStatus: Colors.lightGreen);

  static void error(BuildContext context, String message,
      {String title = "Ocurrio un problema"}) =>
      _showTopSnackBar(context,message, title,
          colorStatus: Colors.red, colorTitle: Colors.white);

  static void advertence(BuildContext context, String message,
      {String title = "Advertencia"}) =>
      _showTopSnackBar(context, message, title, colorStatus: Colors.yellowAccent);

  static void _showTopSnackBar(BuildContext context, String message, String title, {required Color colorStatus, Color colorTitle = Colors.black}) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final overlay = Overlay.of(context);
      final overlayEntry = OverlayEntry(
        builder: (context) => Positioned(
          top: MediaQuery.of(context).padding.top + 10, // 🔥 Lo posiciona debajo de la barra de estado
          left: 10,
          right: 10,
          child: Material(
            color: Colors.transparent,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              decoration: BoxDecoration(
                color: colorStatus,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: TextStyle(fontWeight: FontWeight.bold, color: colorTitle, fontSize: 16)),
                  SizedBox(height: 4),
                  Text(message, style: TextStyle(color: Colors.white, fontSize: 14))
                ])))));

      overlay.insert(overlayEntry);

      Future.delayed(const Duration(seconds: 5), () {
        overlayEntry.remove();
      });
    });
  }

}