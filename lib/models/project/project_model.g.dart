// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProjectModel _$$_ProjectModelFromJson(Map<String, dynamic> json) =>
    _$_ProjectModel(
      id: json['id'] as String? ?? "",
      name: json['name'] as String? ?? "",
      publisher: json['publisher'] as String? ?? "",
      logo: json['logo'] as String? ?? "",
    );

Map<String, dynamic> _$$_ProjectModelToJson(_$_ProjectModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'publisher': instance.publisher,
      'logo': instance.logo,
    };
