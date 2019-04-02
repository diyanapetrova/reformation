import 'dart:async';
import 'dart:convert';
import 'dart:io';

main() {
//  final file = new File('resources/places.txt');
//  var output = new File('places.dart');
////  var sink = output.openWrite();
////  sink.write(writeIntro());
//
////  Stream<List<int>> inputStream = file.openRead();
//
//  String mapAsJson = '{"language":"dart"}';  // input Map of data
//  Map parsedMap = json.decode(mapAsJson);
//  print(parsedMap["language"]);
//
//
//  // Close the IOSink to free system resources.
////  sink.close();


}

String writeIntro(){
  var buffer = new StringBuffer();
  buffer.write("import 'package:reformation/model/resource.dart';");
  buffer.write('\n');
  buffer.writeln("class Place extends Resource {");
  buffer.writeln("  final double lat;");
  buffer.writeln("  final double lon;");
  buffer.writeln("  final String icon;");
  buffer.writeln("  final String text;");
  buffer.write('\n');
  buffer.writeln("const Place(this.lat, this.lon, name, this.image, this.text, this.icon)");
  buffer.writeln("      : super(name);");
  buffer.writeln("}");

  return buffer.toString();
}


