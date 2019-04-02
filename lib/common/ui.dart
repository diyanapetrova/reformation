import 'package:flutter/material.dart';
import 'package:reformation/common/text_style.dart';

class CustomText {
  static List<Widget> transform(List<String> text) {
    List<Widget> list = new List();
    text.forEach((paragraph) {
      list.add(Container(
        child: Text(
          paragraph,
          style: Style.baseTextStyle,
        ),
        padding: EdgeInsets.all(15),
      ));
      list.add(Divider(
        color: Colors.white,
        height: 3,
      ));
    });

    return list;
  }
}