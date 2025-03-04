import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:open_library/core/values/enums.dart';

class CustomImageCircle extends StatelessWidget {
  final String url;
  final Color? backgroundColor; // Color de fondo
  final double? radius; // Radio del círculo
  final Color? borderColor;
  final double? borderWidth; // Grosor del borde
  final double paddingAll;
  late final TypeImageContain _isNetwork; // Indica si es una imagen de red o local



  CustomImageCircle.assets({super.key, this.backgroundColor,this.radius,this.borderColor,this.paddingAll=0, this.borderWidth,  required this.url}){
    _isNetwork=TypeImageContain.asset;
  }

  CustomImageCircle.netWork({super.key, this.backgroundColor,this.radius,this.borderColor,this.paddingAll=0, this.borderWidth, required this.url}){
    _isNetwork=TypeImageContain.network;
  }
  CustomImageCircle.file({super.key, this.backgroundColor,this.radius,this.borderColor,this.paddingAll=0, this.borderWidth, required this.url}){
    _isNetwork=TypeImageContain.file;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(paddingAll), // Padding alrededor de la imagen
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor ?? Colors.black,
          width: borderWidth ?? 2.0)),
      child: ClipOval(
        child: _selectTypeImage(_isNetwork)));
  }

  _selectTypeImage(TypeImageContain type){
    switch(type){
      case TypeImageContain.network:
        return CachedNetworkImage(
            imageUrl: url,
            height: radius! * 2,
            width: radius! * 2,
            fit: BoxFit.cover,
            errorWidget: (context, error, stackTrace) => Icon(Icons.error, size: radius));
        case TypeImageContain.asset:
         return Image.asset(
              url,
              height: radius! * 2,
              width: radius! * 2,
              fit: BoxFit.cover);
          case TypeImageContain.file:
            return Image.file(
                File(url),
                height: radius! * 2,
                width: radius! * 2,
                fit: BoxFit.cover);

    }
  }
}
