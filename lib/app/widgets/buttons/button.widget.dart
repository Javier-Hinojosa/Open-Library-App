import 'package:flutter/material.dart';
import 'package:open_library/app/widgets/text.widget.dart';
import 'package:open_library/core/values/globals.dart';
import 'package:open_library/core/values/text.styles.dart';

class CustomButton extends StatelessWidget{


  final void Function()? onPressed;
  final void Function()? onLongPressed;
  final double? height;
  final double? width;
  final Color? backgroundColor;

  late final Color? _textColor;
  late final String? _title;
  late final Widget? _child;



   CustomButton({super.key, this.onPressed,this.onLongPressed,this.backgroundColor, this.height,this.width,String? title, Color? textColor})
       :_title=title,_textColor=textColor,_child=null;

   CustomButton.child({super.key, this.onPressed,this.onLongPressed,this.backgroundColor, this.height,this.width, Widget? child}):
     _child=child;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor,
              padding: width==null?const EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0):null),
          onPressed: onPressed,
          onLongPress: onLongPressed,
          child: _child??Container(
              alignment: Alignment.center,
              width: width??MediaQuery.of(context).size.width,
              height: height,
            child: CustomText(_title??"",
                isScaleDown: true,
                style: bodyMedium.apply(color: validateTextColor(context),fontWeightDelta: FontWeight.w600.value))
          )
        )
      )
    );
  }

Color validateTextColor(BuildContext context){
     if(onPressed==null){
   return Colors.black45;
 } else if(_textColor!=null) {
   return _textColor;
 } else{
   switch(backgroundColor){
     case Globals.backgroundColor:return bodyMedium.color??Colors.black;
     case Colors.black:return Colors.white;
     case Colors.white:return Colors.black;
     default: return Theme.of(context).cardColor;
   }}}
}

