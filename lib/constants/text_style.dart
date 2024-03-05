import 'package:flutter/material.dart';

TextStyle style({double? fontSize, Color? color, bool bold = false}) =>
    TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: bold ? FontWeight.bold : FontWeight.normal,
    );
