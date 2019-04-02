// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Source _$SourceFromJson(Map<String, dynamic> json) {
  return Source(
      json['name'],
      json['introduction'] as String,
      json['source'] as String,
      (json['text'] as List).map((e) => e as String).toList());
}

Map<String, dynamic> _$SourceToJson(Source instance) => <String, dynamic>{
      'name': instance.name,
      'introduction': instance.introduction,
      'text': instance.text,
      'source': instance.source
    };
