part of 'place.dart';

Place _$PlaceFromJson(Map<String, dynamic> json) {
  return Place(
      json['name'] as String,
      json['lat'] as double,
      json['lon'] as double,
      json['image'] as String,
      json['icon'] as String,
      json['text'] as List);
}

Map<String, dynamic> _$PersonToJson(Place instance) => <String, dynamic>{
      'name': instance.name,
      'lat': instance.lat,
      'lon': instance.lon,
      'image': instance.image,
      'icon': instance.icon,
      'text': instance.text
    };
