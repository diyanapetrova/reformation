part of 'person.dart';

Person _$PersonFromJson(Map<String, dynamic> json) {
  return Person(json['name'] as String, json['period'] as String,
      json['image'] as String, json['description'] as String);
}

Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
      'name': instance.name,
      'period': instance.period,
      'image': instance.image,
      'description': instance.description
    };
