import 'package:flutter/material.dart';
import 'package:reformation/common/card.dart';
import 'package:reformation/common/color_sheme.dart';
import 'package:reformation/data/people.dart';

class PeoplePage extends StatelessWidget {
  final String title = 'People';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Palette.purple,
      ),
//      drawer: MyDrawer(),
      body: new Column(
        children: <Widget>[
          PersonSummary(people[0], true),
          PersonSummary(people[0], true),
        ],
      ),
    );
  }
}
