import 'package:flutter/material.dart';

const pages = ["Home", "People", "Places", "Timeline", "Sources"];

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
          children: pages
              .map((item) => new ListTile(
                    title: Text(item),
                    onTap: () {
                      Navigator.pushNamed(context, '/$item');
                    },
                  ))
              .toList()),
    );
  }
}
