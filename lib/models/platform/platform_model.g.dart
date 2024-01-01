// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'platform_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlatformModelImpl _$$PlatformModelImplFromJson(Map<String, dynamic> json) =>
    _$PlatformModelImpl(
      platform: $enumDecode(_$PlatformEnumEnumMap, json['platform']),
      id: json['id'] as String? ?? "",
      link: json['link'] as String? ?? "",
      rating: (json['rating'] as num?)?.toDouble() ?? 5.0,
    );

Map<String, dynamic> _$$PlatformModelImplToJson(_$PlatformModelImpl instance) =>
    <String, dynamic>{
      'platform': _$PlatformEnumEnumMap[instance.platform]!,
      'id': instance.id,
      'link': instance.link,
      'rating': instance.rating,
    };

const _$PlatformEnumEnumMap = {
  PlatformEnum.android: 'android',
  PlatformEnum.ios: 'ios',
  PlatformEnum.windows: 'windows',
  PlatformEnum.linux: 'linux',
  PlatformEnum.macOS: 'macOS',
  PlatformEnum.web: 'web',
};
