import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget{
  String msg;
  TextStyle? style;
      TextAlign textAlign ;
  TextOverflow overflow = TextOverflow.clip;

  CustomText(this.msg,this.style,{this.textAlign = TextAlign.justify,this.overflow = TextOverflow.clip});
  @override
  Widget build(BuildContext context) {
    if (msg == null) {
      return SizedBox(
        height: 0,
        width: 0,
      );
    } else {
      if (context != null && style != null) {
        var fontSize =
            style?.fontSize ?? Theme.of(context).textTheme.bodyText1?.fontSize;
        style = style?.copyWith(
            fontSize: fontSize! - (MediaQuery.of(context).size.width <= 375 ? 2 : 0));
      }
      return Text(
        msg,
        style: style,
        textAlign: textAlign,
        overflow: overflow,
      );
    }
  }

}