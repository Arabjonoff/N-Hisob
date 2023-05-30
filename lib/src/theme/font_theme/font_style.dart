import 'package:flutter/material.dart';
class Styles{
  static String fontFamily = 'Roboto';
  static TextStyle boldH1(Color color){
    return TextStyle(
      fontSize: 30,
      fontStyle: FontStyle.normal,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w700,
      color: color
    );
  }
  static TextStyle boldH2(Color color){
    return TextStyle(
      fontSize: 20,
      fontStyle: FontStyle.normal,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w700,
      color: color
    );
  }
  static TextStyle boldH4(Color color){
    return TextStyle(
      fontSize: 24,
      fontStyle: FontStyle.normal,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
      color: color
    );
  }
  static TextStyle body(Color color){
    return TextStyle(
      fontSize: 18,
      fontStyle: FontStyle.normal,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w400,
      color: color
    );
  }
  static TextStyle bodyP(Color color,bool underline){
    return TextStyle(
      decoration: underline?TextDecoration.underline:TextDecoration.none,
      fontSize: 14,
      fontStyle: FontStyle.normal,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
      color: color
    );
  }
}