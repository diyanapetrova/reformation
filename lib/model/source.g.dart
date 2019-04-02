part of 'source.dart';

Source _$SourceFromJson(Map<String, dynamic> json) {
  return Source(json['name'] as String, json['introduction'] as String,
      json['source'] as String, json['text'] as List);
}

Map<String, dynamic> _$PersonToJson(Source instance) => <String, dynamic>{
  'name': instance.name,
  'introduction': instance.introduction,
  'source': instance.source,
  'text': instance.text
};
