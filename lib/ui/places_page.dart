import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:reformation/common/text_style.dart';
import 'package:reformation/model/place.dart';

class PlacesPage extends StatelessWidget {
  final String title = 'Places';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Places")),
      body: new Padding(
        padding: new EdgeInsets.all(8.0),
        child: new Column(
          children: [
            new Padding(
              padding: new EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: new Text("This is a map that is showing (51.5, -0.9)."),
            ),
            new Flexible(
              child: new FlutterMap(
                options: new MapOptions(
                  center: new LatLng(56.34, -2.79),
                  zoom: 15.0,
                ),
                layers: [
                  new TileLayerOptions(
                      urlTemplate:
                      "https://api.mapbox.com/v4/{id}/{z}/{x}/{y}@2x.png?style=mapbox://styles/dp68/cjsbwdmgg1gnz1fquorvwwr7o@00&access_token={accessToken}",
                      additionalOptions: {
                        'accessToken':
                        'pk.eyJ1IjoiZHA2OCIsImEiOiJjanM0aTRhdzQwNHQ1M3lsZGllcnhiZGZ2In0.UyG0-n898ZL2m6sPducIrA',
                        'id': 'mapbox.streets'
                        //'mapbox.mapbox-streets-v8,dp68.cjskc5fgt1l332yqzp4tc4a0h-7lc1w',
                      }),
                  new MarkerLayerOptions(markers: _markers(context))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Marker> _markers(BuildContext context) {
    var markers = places
        .map(
          (place) => Marker(
          point: LatLng(place.lat, place.lon),
          builder: (ctx) => GestureDetector(
            onTap: () {
              Navigator.of(context).push(PlaceOverlay(place));
            },
            child: Container(child: new FlutterLogo()),
          )),
    )
        .toList();
    return markers;
  }
}

class PlaceOverlay extends ModalRoute<void> {
  final Place place;

  PlaceOverlay(this.place);

  @override
  Duration get transitionDuration => Duration(milliseconds: 500);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor => Colors.black.withOpacity(0.5);

  @override
  String get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Widget buildPage(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      ) {
    // This makes sure that text and other content follows the material style
    return Material(
      type: MaterialType.transparency,
      // make sure that the overlay content is not cut off
      child: SafeArea(
        child: _buildOverlayContent(context),
      ),
    );
  }

  Widget _buildOverlayContent(BuildContext context) {
    return Center(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
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
            child: Column(
              children: <Widget>[
                Text(
                  place.name,
                  style: Style.headerTextStyle,
                ),
                Container(
                  height: 400.0,
                  width: 400.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(place.image))),
                ),
                Text(
                  place.text,
                  style: Style.baseTextStyle,
                ),
                RaisedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Dismiss'),
                )
              ],
            ),
          ),
        ));
//            Center(child: Text(title, style: Style.headerTextStyleWhite)))
//      child: Column(
//        mainAxisSize: MainAxisSize.min,
//        children: <Widget>[
//
////          Text(
////            'This is a nice overlay',
////            style: TextStyle(color: Colors.white, fontSize: 30.0),
////          ),
////          RaisedButton(
////            onPressed: () => Navigator.pop(context),
////            child: Text('Dismiss'),
////          )
//        ],
//      ),
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
                          Animation<double> secondaryAnimation, Widget child) {
    // You can add your own animations for the overlay content
    return FadeTransition(
      opacity: animation,
      child: ScaleTransition(
        scale: animation,
        child: child,
      ),
    );
  }
}
