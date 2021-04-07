import 'package:journal_app/src/Models/NotesModel/Notes.dart';
import 'package:json_annotation/json_annotation.dart';

part 'Notebooks.g.dart';

@JsonSerializable()

class Notebooks {
  String name;
  String color;
  List<Notes> notes;

  Notebooks({
    this.name,
    this.color,
    this.notes
  });

  factory Notebooks.fromJson(Map<String, dynamic> json) => _$NotebooksFromJson(json);

  Map<String, dynamic> toJson() => _$NotebooksToJson(this);
}