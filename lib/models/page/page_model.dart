/*

  Created by: Bakhromjon Polat
  Created on: Jun 25 2023 21:46:26
  Github:   https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:yaaseen/models/verse/verse_model.dart';

part 'page_model.freezed.dart';
part 'page_model.g.dart';

@freezed
class PageModel with _$PageModel {
  const factory PageModel({
    @Default(83) int surah,
    @Default(1) int start,
    @Default(3) int end,
    @Default([]) List<VerseModel> verses,
  }) = _PageModel;

  factory PageModel.fromJson(Map<String, dynamic> json) =>
      _$PageModelFromJson(json);
}
