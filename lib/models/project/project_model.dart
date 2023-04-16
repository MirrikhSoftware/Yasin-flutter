/*

  Created by: Bakhromjon Polat
  Created on: Apr 16 2023 19:41:38
  Github:   https://github.com/BahromjonPolat
  Leetcode: https://leetcode.com/BahromjonPolat/
  LinkedIn: https://linkedin.com/in/bahromjon-polat
  Telegram: https://t.me/BahromjonPolat

  Documentation: 

*/

import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_model.g.dart';
part 'project_model.freezed.dart';

@freezed
class ProjectModel with _$ProjectModel {
  const factory ProjectModel({
    @Default("") String id,
    @Default("") String name,
    @Default("") String publisher,
    @Default("") String logo,
  }) = _ProjectModel;

  factory ProjectModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectModelFromJson(json);
}
