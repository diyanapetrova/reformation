import 'package:flutter/material.dart';
import 'package:reformation/common/color_sheme.dart';
import 'package:reformation/main.dart';
import 'package:reformation/ui/details_page.dart';

class Common {
  static List<Widget> transformParagraphsToText(
      List<String> text, BuildContext context) {
    List<Widget> list = List();
    text.forEach((paragraph) {
      list.add(Container(
        child: Text(
          paragraph,
          style: Theme.of(context).textTheme.body1,
        ),
      ));
      list.add(Divider(
        color: Palette.background,
      ));
    });
    return list;
  }

  static Widget references(List<String> references, BuildContext context) {
    return Wrap(
        spacing: 4.0, // gap between adjacent chips
        runSpacing: 4.0, // gap between lines
        children: references
            .map((ref) => GestureDetector(
                child: Chip(
                  label: Text(
                    ref,
                    style: Theme.of(context)
                        .textTheme
                        .body1
                        .apply(color: Colors.white),
                  ),
                  backgroundColor: Palette.blue,
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailsPage(content[ref])));
                }))
            .toList());
  }
}
