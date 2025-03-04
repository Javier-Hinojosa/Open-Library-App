import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget{

  final void Function()? onPressed;
  final IconData icon;
  ///[iconWidget]this property replace the property icon.
  ///So the property's how [icon],[color],[size] is useless
  final Widget? iconWidget;
  final Color? backgroundColor;
  final Color? color;
  final double? size;
  final double? width;
  final double? height;

  const CustomIconButton({super.key, this.onPressed, this.icon=Icons.arrow_back_ios,this.backgroundColor, this.iconWidget, this.size,this.color, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width??MediaQuery.of(context).size.width*0.1,
        height: height??MediaQuery.of(context).size.height*0.045,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30.0),
          child: IconButton(
            style: ElevatedButton.styleFrom(backgroundColor: backgroundColor, padding: const EdgeInsets.symmetric(horizontal: 5.0),),
            onPressed: onPressed,
            icon: iconWidget??Icon(icon,size: size,color: color)))
    );
  }
}