/*

  Created by: Bakhromjon Polat
  Created on: Apr 16 2023 19:49:05
  Github:   https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'package:freezed_annotation/freezed_annotation.dart';

part 'platform_model.freezed.dart';
part 'platform_model.g.dart';

@freezed
class PlatformModel with _$PlatformModel {
  factory PlatformModel({
    required PlatformEnum platform,
    @Default("") String id,
    @Default("") String link,
    @Default(5.0) double rating,
  }) = _PlatformModel;

  factory PlatformModel.fromJson(Map<String, dynamic> json) =>
      _$PlatformModelFromJson(json);
}

enum PlatformEnum {
  android("Android"),
  ios("iOS"),
  windows("Windows"),
  linux("Linux"),
  macOS("MacOS"),
  web("Web");

  final String value;
  const PlatformEnum(this.value);
}
