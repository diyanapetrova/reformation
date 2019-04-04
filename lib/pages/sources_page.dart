import 'package:flutter/material.dart';
import 'package:reformation/ui/card.dart';
import 'package:reformation/ui/color_sheme.dart';
import 'package:reformation/main.dart';

class SourcesPage extends StatelessWidget {
  final String title = 'Sources';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text(title),
          backgroundColor: Color(0xFF00539B),
        ),
        body: SingleChildScrollView(
          child: Column(
              children: sources
                  .map((source) => ResourceSummary(source, true))
                  .toList()),
        ),
        backgroundColor: Palette.background);
  }
}
