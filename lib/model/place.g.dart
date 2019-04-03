// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Place _$PlaceFromJson(Map<String, dynamic> json) {
  return Place(
      json['name'],
      (json['lat'] as num).toDouble(),
      (json['lon'] as num).toDouble(),
      json['image'] as String,
      json['icon'] as String,
      (json['text'] as List).map((e) => e as String).toList(),
      (json['references'] as List).map((e) => e as String).toList());
}

Map<String, dynamic> _$PlaceToJson(Place instance) => <String, dynamic>{
      'name': instance.name,
      'lat': instance.lat,
      'lon': instance.lon,
      'image': instance.image,
      'icon': instance.icon,
      'text': instance.text,
      'references': instance.references
    };
