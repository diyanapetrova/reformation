import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:reformation/model/person.dart';
import 'package:reformation/model/place.dart';
import 'package:reformation/model/resource.dart';
import 'package:reformation/model/source.dart';
import 'package:reformation/pages/home_page.dart';
import 'package:reformation/pages/people_page.dart';
import 'package:reformation/pages/places_page.dart';
import 'package:reformation/pages/sources_page.dart';
import 'package:reformation/pages/timeline_page.dart';

void main() => runApp(MyApp());

Map<String, Resource> content = Map();
List<Person> people;
List<Place> places;
List<Source> sources;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _loadResources(content);
    return MaterialApp(
      title: 'St Andrews Reformation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'PT Sans',
        textTheme: TextTheme(
          title: TextStyle(fontSize: 25.0),
          caption: TextStyle(fontSize: 14.0),
          body1: TextStyle(fontSize: 18.0),
        ),
      ),
      home: HomePage(),
      routes: {
        '/Home': (context) => HomePage(),
        '/People': (context) => PeoplePage(),
        '/Places': (context) => PlacesPage(),
        '/Timeline': (context) => TimelinePage(),
        '/Sources': (context) => SourcesPage(),
      },
    );
  }
}

void _loadResources(Map<String, Resource> content) {
  var peopleRaw = rootBundle.loadString('resources/people.json');
  peopleRaw.then((result) {
    people = _listPeople(result);
    people.forEach((person) => content[person.name] = person);
  });

  var placesRaw = rootBundle.loadString('resources/places.json');
  placesRaw.then((result) {
    places = _listPlaces(result);
    places.forEach((place) => content[place.name] = place);
  });

  var sourcesRaw = rootBundle.loadString('resources/sources.json');
  sourcesRaw.then((result) {
    sources = _listSources(result);
    sources.forEach((source) => content[source.name] = source);
  });
}

List<Person> _listPeople(asset) {
  var data = json.decode(asset) as List;
  List<Person> list = data.map((json) => Person.fromJson(json)).toList();
  return list;
}

List<Place> _listPlaces(asset) {
  var data = json.decode(asset) as List;
  List<Place> list = data.map((json) => Place.fromJson(json)).toList();
  return list;
}

List<Source> _listSources(asset) {
  var data = json.decode(asset) as List;
  List<Source> list = data.map((json) => Source.fromJson(json)).toList();
  return list;
}

//flutter packages pub run build_runner build
