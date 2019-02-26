import 'package:flutter/material.dart';
import 'package:reformation/common/text_style.dart';
import 'package:reformation/model/person.dart';
import 'package:reformation/ui/details_page.dart';

class PersonSummary extends StatelessWidget {
  final Person person;
  final bool horizontal;

  PersonSummary(this.person, this.horizontal);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: horizontal
            ? () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailsPage(person)),
                );
              }
            : null,
        child: Container(
            margin: const EdgeInsets.symmetric(
              vertical: 16.0,
              horizontal: 24.0,
            ),
            child: Stack(
              children: <Widget>[
                _card(),
                _image(),
              ],
            )));
  }

  Widget _image() {
    return Container(
      margin: horizontal
          ? EdgeInsets.symmetric(vertical: 16.0)
          : EdgeInsets.fromLTRB(130, 25, 135, 0),
      alignment:
          horizontal ? FractionalOffset.centerLeft : FractionalOffset.center,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(person.image),
          )),
      height: 92.0,
      width: 92.0,
    );
  }

  Widget _card() {
    return Container(
      height: horizontal ? 124.0 : 154.0,
      margin: horizontal
          ? new EdgeInsets.only(left: 46.0)
          : new EdgeInsets.only(top: 72.0),
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
          ),
        ],
      ),
      child: cardContent(),
    );
  }

  Widget cardContent() {
    return Container(
//        margin: EdgeInsets.fromLTRB(76.0, 16.0, 16.0, 16.0),
        margin: new EdgeInsets.fromLTRB(
            horizontal ? 76.0 : 16.0, horizontal ? 16.0 : 42.0, 16.0, 16.0),
        constraints: BoxConstraints.expand(),
        child: Column(
          crossAxisAlignment:
              horizontal ? CrossAxisAlignment.start : CrossAxisAlignment.center,
          children: <Widget>[
            Container(height: 4.0),
            Text(
              person.name,
              style: Style.headerTextStyle,
            ),
            Container(height: 10.0),
            Text(person.period, style: Style.subHeaderTextStyle),
          ],
        ));
  }
}
