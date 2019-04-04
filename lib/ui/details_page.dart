import 'package:flutter/material.dart';
import 'package:reformation/common/card.dart';
import 'package:reformation/common/color_sheme.dart';
import 'package:reformation/common/things.dart';
import 'package:reformation/model/person.dart';
import 'package:reformation/model/place.dart';
import 'package:reformation/model/resource.dart';
import 'package:reformation/model/source.dart';

class DetailsPage extends StatelessWidget {
  final Resource resource;

  DetailsPage(this.resource);

  @override
  Widget build(BuildContext context) {
    List<Widget> content;
    if (resource is Person)
      content = _personContent(resource, context);
    else if (resource is Place)
      content = _placeDetails(resource, context);
    else if (resource is Source) content = _sourceDetails(resource, context);

    return Scaffold(
        backgroundColor: Palette.background,
        body: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              _background(),
              _backButton(context),
              ResourceSummary(
                resource,
                false,
              ),
              Container(
                child: Column(
                  children: content,
                ),
                padding:
                    EdgeInsets.only(left: 24, right: 24, top: 260, bottom: 24),
              )
            ],
          ),
        ));
  }

  Widget _backButton(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 5),
      child: BackButton(color: Colors.white),
    );
  }

  Widget _background() {
    return Container(
        height: 300,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Palette.blue, Palette.background],
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter),
        ));
  }

  List<Widget> _personContent(Person person, BuildContext context) {
    List<Widget> list = new List();

    list.addAll(Common.transformParagraphsToText(person.text, context));

    list.add(Common.references(person.references, context));

    return list;
  }

  List<Widget> _placeDetails(Place place, BuildContext context) {
    List<Widget> list = new List();

    list.addAll(Common.transformParagraphsToText(place.text, context));

    list.add(Common.references(place.references, context));

    return list;
  }

  List<Widget> _sourceDetails(Source source, BuildContext context) {
    List<Widget> list = new List();

    list.add(Text(source.introduction,
        style: Theme.of(context)
            .textTheme
            .body1
            .copyWith(fontStyle: FontStyle.italic)));

    list.add(Divider(
      color: Palette.background,
    ));

    list.addAll(Common.transformParagraphsToText(source.text, context));

    list.add(Text(source.source,
        style: Theme.of(context)
            .textTheme
            .body1
            .copyWith(fontWeight: FontWeight.bold)));

    return list;
  }
}
