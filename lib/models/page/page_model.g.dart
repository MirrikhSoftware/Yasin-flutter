// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PageModelImpl _$$PageModelImplFromJson(Map<String, dynamic> json) =>
    _$PageModelImpl(
      surah: json['surah'] as int? ?? 83,
      start: json['start'] as int? ?? 1,
      end: json['end'] as int? ?? 3,
      verses: (json['verses'] as List<dynamic>?)
              ?.map((e) => VerseModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$PageModelImplToJson(_$PageModelImpl instance) =>
    <String, dynamic>{
      'surah': instance.surah,
      'start': instance.start,
      'end': instance.end,
      'verses': instance.verses,
    };
