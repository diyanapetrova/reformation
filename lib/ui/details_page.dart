import 'package:flutter/material.dart';
import 'package:reformation/common/card.dart';
import 'package:reformation/common/things.dart';
import 'package:reformation/model/person.dart';
import 'package:reformation/model/place.dart';
import 'package:reformation/model/resource.dart';
import 'package:reformation/ui/places_page.dart';

class DetailsPage extends StatelessWidget {
  final Resource resource;

  DetailsPage(this.resource);

  @override
  Widget build(BuildContext context) {
    Widget content;
    if (resource is Person)
      content = _personDetails(resource, context);
    else if (resource is Place) content = _placeDetails(resource);

    return Scaffold(body: content);
  }

  Widget _personDetails(Person person, BuildContext context) {
    return Column(
      children: _personContent(person, context),
    );
  }

  List<Widget> _personContent(Person person, BuildContext context) {
    List<Widget> list = new List();
    list.add(
      PersonSummary(
        person,
        false,
      ),
    );
    list.addAll(Common.transformParagraphsToText(person.text, context));

    return list;
  }

  Widget _placeDetails(Place place) {
    return PlaceContent(place);
  }

  Widget _sourceDetails() {
    //todo implement source details
    return null;
  }
}
