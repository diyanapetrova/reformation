import 'package:flutter/material.dart';
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
        padding: EdgeInsets.all(15),
      ));
      list.add(Divider(
        color: Colors.white,
        height: 3,
      ));
    });
    return list;
  }

  static Widget references(List<String> references, BuildContext context) {
    return Wrap(
        spacing: 6.0, // gap between adjacent chips
        runSpacing: 4.0, // gap between lines
        children: references
            .map((ref) => GestureDetector(
                child: Chip(
                    label: Text(
                  ref,
                  style: Theme.of(context).textTheme.body1,
                )),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailsPage(content[ref])));
                }))
            .toList());
  }
}
