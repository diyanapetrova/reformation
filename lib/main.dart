import 'package:flutter/material.dart';
import 'package:reformation/ui/home_page.dart';
import 'package:reformation/ui/places_page.dart';
import 'package:reformation/ui/people_page.dart';
import 'package:reformation/ui/sources_page.dart';
import 'package:reformation/ui/timeline_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'St Andrews Reformation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      routes: {
        '/Home': (context) => MyHomePage(),
        '/People': (context) => PeoplePage(),
        '/Places': (context) => PlacesPage(),
        '/Timeline': (context) => TimelinePage(),
        '/Sources': (context) => SourcesPage(),
      },
    );
  }
}
