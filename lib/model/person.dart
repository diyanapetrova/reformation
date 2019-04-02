import 'package:json_annotation/json_annotation.dart';
import 'package:reformation/model/resource.dart';

part 'person.g.dart';

@JsonSerializable(nullable: false)
class Person extends Resource {
  final String image;
  final List<String> text;
  final String summary;

  Person(name, this.image, this.text, this.summary) : super(name);
}
