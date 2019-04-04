import 'package:json_annotation/json_annotation.dart';
import 'package:reformation/model/resource.dart';

part 'person.g.dart';

@JsonSerializable(nullable: false)
class Person extends Resource {
  final String image;
  final List<String> text;
  final List<String> references;

  Person(name, this.text,summary, this.references, {this.image = "images/people/no_photo.png"}) : super(name, summary);
  factory Person.fromJson(Map<String, dynamic> json) =>
      _$PersonFromJson(json);
}