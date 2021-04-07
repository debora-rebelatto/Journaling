// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Notes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notes _$NotesFromJson(Map<String, dynamic> json) {
  return Notes(
    name: json['name'] as String,
    color: json['color'] as String,
    date: json['date'] as String,
  );
}

Map<String, dynamic> _$NotesToJson(Notes instance) => <String, dynamic>{
      'name': instance.name,
      'color': instance.color,
      'date': instance.date,
    };
