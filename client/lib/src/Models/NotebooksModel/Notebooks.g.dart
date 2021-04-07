// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Notebooks.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notebooks _$NotebooksFromJson(Map<String, dynamic> json) {
  return Notebooks(
    name: json['name'] as String,
    color: json['color'] as String,
    notes: (json['notes'] as List)
        ?.map(
            (e) => e == null ? null : Notes.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$NotebooksToJson(Notebooks instance) => <String, dynamic>{
      'name': instance.name,
      'color': instance.color,
      'notes': instance.notes,
    };
