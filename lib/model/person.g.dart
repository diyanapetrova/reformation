// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Person _$PersonFromJson(Map<String, dynamic> json) {
  if (json['image'] == null) {
    return Person(
        json['name'],
        (json['text'] as List).map((e) => e as String).toList(),
        json['summary'] as String,
        (json['references'] as List).map((e) => e as String).toList());
  }
  return Person(
      json['name'],
      (json['text'] as List).map((e) => e as String).toList(),
      json['summary'] as String,
      (json['references'] as List).map((e) => e as String).toList(),
      image: json['image'] as String);
}

Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'text': instance.text,
      'summary': instance.summary,
      'references': instance.references
    };
