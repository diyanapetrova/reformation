import 'package:flutter/material.dart';
import 'package:reformation/ui/color_sheme.dart';
import 'package:reformation/ui/text_style.dart';
import 'package:reformation/model/person.dart';
import 'package:reformation/model/place.dart';
import 'package:reformation/model/resource.dart';
import 'package:reformation/model/source.dart';
import 'package:reformation/pages//details_page.dart';

class ResourceSummary extends StatelessWidget {
  final Resource resource;
  final bool horizontal;

  ResourceSummary(this.resource, this.horizontal);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: horizontal
            ? () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailsPage(resource)),
                );
              }
            : null,
        child: Container(
          margin: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 24.0,
          ),
          child: Stack(
            children: stack(context),
          ),
        ));
  }

  List<Widget> stack(BuildContext context) {
    List<Widget> stack = List();
    stack.add(_card(context));
    if (resource is Person) stack.add(_image(resource));
    return stack;
  }

  Widget _image(Person person) {
    return Container(
      margin: horizontal
          ? EdgeInsets.symmetric(vertical: 16.0)
          : EdgeInsets.fromLTRB(130, 25, 135, 0),
      alignment:
          horizontal ? FractionalOffset.centerLeft : FractionalOffset.center,
      decoration: BoxDecoration(
          color: Palette.blue,
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(person.image),
          )),
      height: 92.0,
      width: 92.0,
    );
  }

  Widget _card(BuildContext context) {
    return Container(
      height: (!horizontal && (resource is Person)) || resource is Source
          ? 156.0
          : 124.0,
      margin: horizontal && resource is Person
          ? EdgeInsets.only(left: 46.0)
          : horizontal && !(resource is Person)
              ? EdgeInsets.all(0)
              : resource is Place
                  ? EdgeInsets.only(top: 240)
                  : EdgeInsets.only(top: 72.0),
      decoration: BoxDecoration(
        color: Colors.white,
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
      child: cardContent(context),
    );
  }

  Widget cardContent(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(
            horizontal && resource is Person ? 76.0 : 16.0,
            !horizontal && resource is Person ? 42.0 : 16.0,
            16.0,
            16.0),
        constraints: BoxConstraints.expand(),
        child: Column(
          crossAxisAlignment: horizontal && resource is Person
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.center,
          children: <Widget>[
            Container(height: 4.0),
            Text(
              resource.name,
              style: Style.headerTextStyle,
              textAlign: horizontal && resource is Person
                  ? TextAlign.start
                  : TextAlign.center,
            ),
            Container(height: resource is Source ? 20.0 : 10.0),
            Text(
              resource.summary,
              style: Theme.of(context).textTheme.body1,
              textAlign: horizontal && resource is Person
                  ? TextAlign.start
                  : TextAlign.center,
            ),
          ],
        ));
  }
}
