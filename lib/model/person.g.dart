part of 'person.dart';

Person _$PersonFromJson(Map<String, dynamic> json) {
  return Person(json['name'] as String, json['image'] as String,
      json['text'] as List, json['summary'] as String);
}

Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'text': instance.text
    };
