import 'package:flutter/material.dart';
import 'package:reformation/common/card.dart';
import 'package:reformation/common/text_style.dart';
import 'package:reformation/model/person.dart';

class DetailsPage extends StatelessWidget {
  final Person person;

  DetailsPage(this.person);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          PersonSummary(
            person,
            false,
          ),
          Container(
            margin: EdgeInsets.all(20),
            child: Text(person.description, style: Style.baseTextStyle),
          )
        ],
      ),
    );
  }
}
