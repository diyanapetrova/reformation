import 'package:flutter/material.dart';
import 'package:reformation/common/color_sheme.dart';
import 'package:reformation/common/drawer.dart';
import 'package:reformation/common/text_style.dart';
import 'package:reformation/ui/search.dart';

class HomePage extends StatelessWidget {
  final String title = 'Home';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: SearchBar(title),
//        drawer: MyDrawer(),
        body: HomeGrid());
  }
//    return HomeGrid();
}

class HomeGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> tiles = List.from(pages);
    tiles.remove('Home');
    var colors = {
      "People": Palette.purple,
      "Places": Palette.green,
      "Timeline": Palette.burgundy,
      "Sources": Palette.orange
    };

    return Container(
        margin: EdgeInsets.all(10),
        child: GridView.count(
            crossAxisCount: 2,
            children: tiles
                .map((item) => buildTile(item, context, colors[item]))
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
            child:
                Center(child: Text(title, style: Style.headerTextStyleWhite))));
  }
}
