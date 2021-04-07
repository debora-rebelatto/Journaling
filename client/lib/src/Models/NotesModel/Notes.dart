import 'package:json_annotation/json_annotation.dart';

part 'Notes.g.dart';

@JsonSerializable()

class Notes {
  String name;
  String color;
  String date;

  Notes({
    this.name,
    this.color,
    this.date
  });

  factory Notes.fromJson(Map<String, dynamic> json) => _$NotesFromJson(json);

  Map<String, dynamic> toJson() => _$NotesToJson(this);
}