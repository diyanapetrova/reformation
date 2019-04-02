import 'package:json_annotation/json_annotation.dart';
import 'package:reformation/model/resource.dart';

part 'source.g.dart';

@JsonSerializable(nullable: false)
class Source extends Resource {
  final String introduction;
  final List<String> text;
  final String source;

  Source(name, this.introduction, this.source, this.text) : super(name);

  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);
}
