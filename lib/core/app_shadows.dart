import 'package:flutter/material.dart';

class AppShadows {
  static final BoxShadow shadow_2 = BoxShadow(
    color: Color(0x2d000000),
    blurRadius: 3,
    offset: Offset(0, 1), //(x, y)
  );

  static final BoxShadow shadow_1 = BoxShadow(
    color: Color(0x2d000000),
    blurRadius: 6,
    offset: Offset(0, 2),
  );

  static final BoxShadow shadow0 = BoxShadow(
    color: Color(0x2d000000),
    blurRadius: 11,
    offset: Offset(0, 4),
  );

  static final BoxShadow shadow1 = BoxShadow(
    color: Color(0x2d000000),
    blurRadius: 20,
    offset: Offset(0, 5),
  );

  static final BoxShadow shadow2 = BoxShadow(
    color: Color(0x2d000000),
    blurRadius: 28,
    offset: Offset(0, 7),
  );

  static final BoxShadow shadow_hover = BoxShadow(
    color: Color(0x2d000000),
    blurRadius: 28,
    offset: Offset(0, 7),
  );

  static final BoxShadow light_yellow = BoxShadow(
    color: Color(0xFFFDD030),
    blurRadius: 16,
    offset: Offset(0, 7),
  );

  static final BoxShadow light_blue_1 = BoxShadow(
    color: Color(0xff90B8F9),
    blurRadius: 28,
    offset: Offset(0, 7),
  );

  static final BoxShadow light_blue_2 = BoxShadow(
    color: Color(0xff1152FD),
    blurRadius: 28,
    offset: Offset(0, 7),
  );
}
