import 'package:flutter/material.dart';
import 'package:reformation/ui/card.dart';
import 'package:reformation/ui/color_sheme.dart';
import 'package:reformation/main.dart';

class PeoplePage extends StatelessWidget {
  final String title = 'People';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Palette.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
            children:
                people.map((person) => ResourceSummary(person, true)).toList()),
      ),
      backgroundColor: Palette.background,
    );
  }
}
