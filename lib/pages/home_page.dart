import 'package:flutter/material.dart';
import 'package:reformation/ui/color_sheme.dart';
import 'package:reformation/ui/search.dart';

class HomePage extends StatelessWidget {
  final String title = 'Home';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: SearchBar(title),
      body: Container(
        child: HomeGrid(),
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage("images/home.jpg"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class HomeGrid extends StatelessWidget {
  final pages = ["People", "Places", "Timeline", "Sources"];

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        child: GridView.count(
            crossAxisCount: 2,
            children: pages
                .map((item) =>
                    buildTile(item, context, Palette.categoryColors[item]))
                .toList()));
  }

  Widget buildTile(String title, BuildContext context, Color color) {
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/$title');
        },
        child: Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  offset: Offset(0.0, 10.0),
                ),
              ],
            ),
            child: Center(
                child: Text(title,
                    style: Theme.of(context)
                        .textTheme
                        .headline
                        .apply(color: Colors.white)))));
  }
}
