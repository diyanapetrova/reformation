import 'package:flutter/material.dart';
import 'package:reformation/common/card.dart';
import 'package:reformation/common/color_sheme.dart';
import 'package:reformation/main.dart';

class PeoplePage extends StatelessWidget {
  final String title = 'People';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          backgroundColor: Palette.purple,
        ),
        body: SingleChildScrollView(
          child: Column(
              children:
                  people.map((person) => PersonSummary(person, true)).toList()),
        ));
  }
}
