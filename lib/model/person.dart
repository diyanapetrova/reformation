import 'package:json_annotation/json_annotation.dart';
import 'package:reformation/model/resource.dart';

part 'person.g.dart';

@JsonSerializable(nullable: false)
class Person extends Resource {
  final String period;
  final String image;
  final String description;

  Person(name, this.period, this.image, this.description) : super(name);
}
