import 'package:flutter/material.dart';

 class CustomText extends StatelessWidget{


  final TextStyle? style;
  final int maxLines;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  final bool isScaleDown;
  late final Map<String,bool> _textWithRich;

   CustomText(String title,{super.key,
     this.style,
     this.maxLines=2,
     this.textOverflow=TextOverflow.ellipsis,
     this.isScaleDown=false,
     this.textAlign}){
     _textWithRich={title:false};
   }

  CustomText.rich(Map<String,bool> textWithRich, {super.key,
    this.style,
    this.maxLines=2,
    this.isScaleDown=false,
    this.textOverflow=TextOverflow.ellipsis,
    this.textAlign}){
    _textWithRich=textWithRich;
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isScaleDown,
      replacement: _textRich(),
      child: FittedBox(
          fit: BoxFit.scaleDown,
        child:_textRich()));
  }
 Widget _textRich(){
     return Text.rich(
         TextSpan(text: "",
             children: _textWithRich.map((key, value) => MapEntry(key,TextSpan(
                 text: key,
                 style: value ? const TextStyle(fontWeight: FontWeight.bold):null
             ))).values.toList()),
         style: style,
         textAlign: textAlign,
         maxLines: maxLines,
         softWrap: true,
         overflow: textOverflow);
  }

}