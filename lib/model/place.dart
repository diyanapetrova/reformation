import 'package:json_annotation/json_annotation.dart';
import 'package:reformation/model/resource.dart';

part 'place.g.dart';

@JsonSerializable(nullable: false)
class Place extends Resource {
  final double lat;
  final double lon;
  final String image;
  final String icon;
  final List<String> text;
  final List<String> references;

  const Place(name, this.lat, this.lon, this.image, this.icon, this.text, this.references)
      : super(name);

  factory Place.fromJson(Map<String, dynamic> json) => _$PlaceFromJson(json);
}
