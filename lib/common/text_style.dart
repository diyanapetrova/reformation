import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:reformation/common/color_sheme.dart';

class Style {
  static final baseTextStyle = TextStyle(fontFamily: 'PT Sans', fontSize: 14);

  static final baseTextStyleWhite = baseTextStyle.copyWith(color: Colors.white);

  static final headerTextStyle = baseTextStyle.copyWith(
      color: Palette.black, fontSize: 18, fontWeight: FontWeight.w600);

  static final headerTextStyleWhite = headerTextStyle.copyWith(
    color: Colors.white,
  );

  static final headerTextStyleBlue = headerTextStyle.copyWith(
    color: Palette.blue,
  );

  static final subHeaderTextStyle =
      headerTextStyle.copyWith(fontSize: 16, fontWeight: FontWeight.normal);
}
