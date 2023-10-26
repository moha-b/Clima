import 'package:flutter/material.dart';

class AppTypography {
  // font family
  static const String _fontFamily = "manrope";
  // sizes
  static const double _sp12 = 12;
  static const double _sp18 = 18;
  static const double _sp24 = 24;
  static const double _sp28 = 28;
  static const double _sp48 = 48;
  static const double _sp144 = 144;
  // font weight
  static const FontWeight _bold = FontWeight.bold;
  static const FontWeight _w800 = FontWeight.w800;
  static const FontWeight _w500 = FontWeight.w500;
  static const FontWeight _w400 = FontWeight.w400;

  // 144
  static TextStyle bold144({Color? color}) => TextStyle(
      fontFamily: _fontFamily,
      fontSize: _sp144,
      fontWeight: _w800,
      color: color);
  // 48
  static TextStyle bold48({Color? color}) => TextStyle(
      fontFamily: _fontFamily,
      fontSize: _sp48,
      fontWeight: _w800,
      color: color);
  // 24
  static TextStyle bold24({Color? color}) => TextStyle(
      fontFamily: _fontFamily,
      fontSize: _sp24,
      fontWeight: _w800,
      color: color);
  static TextStyle bold28({Color? color}) => TextStyle(
      fontFamily: _fontFamily,
      fontSize: _sp28,
      fontWeight: _w800,
      color: color);
  // 18
  static TextStyle medium18({Color? color}) => TextStyle(
      fontFamily: _fontFamily,
      fontSize: _sp18,
      fontWeight: _w500,
      color: color);
  // 18
  static TextStyle medium12({Color? color}) => TextStyle(
      fontFamily: _fontFamily,
      fontSize: _sp12,
      fontWeight: _w400,
      color: color);
}
