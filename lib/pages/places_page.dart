import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:reformation/ui/color_sheme.dart';
import 'package:reformation/main.dart';
import 'package:reformation/pages/details_page.dart';

class PlacesPage extends StatelessWidget {
  final String title = 'Places';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Places"),
        backgroundColor: Palette.blue,
      ),
      body: new Padding(
        padding: new EdgeInsets.all(8.0),
        child: new Column(
          children: [
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
        .map((place) => Marker(
            point: LatLng(place.lat, place.lon),
            builder: (ctx) => IconButton(
                icon: Icon(
                  Icons.place,
                  size: 30,
                  color: Palette.blue,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DetailsPage(place)),
                  );
//                  Navigator.of(context).push(DetailsPage(place));
                })))
        .toList();
    return markers;
  }
}
