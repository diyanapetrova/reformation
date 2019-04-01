import 'package:flutter/material.dart';
import 'package:reformation/common/card.dart';
import 'package:reformation/common/text_style.dart';
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
      content = _personDetails(resource);
    else if (resource is Place) content = _placeDetails(resource);

    return Scaffold(body: content);
  }

  Widget _personDetails(Person person) {
    return Column(
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
    );
  }

  Widget _placeDetails(Place place) {
    return PlaceContent(place);
  }

  Widget _sourceDetails() {
    //todo implement source details
    return null;
  }
}
