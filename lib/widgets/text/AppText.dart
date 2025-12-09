import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppText{
  //Widget para texto
  static Widget text({
    required String text,
    Color? textColor,
    double? textFontSize,
    FontWeight? textFontWeight,
    bool oneLine = false
  }){
    return Text(
      text,
      maxLines: oneLine ? 1: null,
      softWrap: oneLine ? true: false,
      style: TextStyle(
        fontFamily: 'Plus Jakarta Sans',
        fontWeight: textFontWeight ?? FontWeight.bold,
        color: textColor ?? Colors.white,
        fontSize: textFontSize ?? 16
      ),
    );
  }
}