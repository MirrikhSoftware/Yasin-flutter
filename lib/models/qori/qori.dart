import 'package:freezed_annotation/freezed_annotation.dart';

part 'qori.freezed.dart';
part 'qori.g.dart';

@freezed
class QoriModel with _$QoriModel {
  const factory QoriModel({
    @Default('') String identifier,
    @Default('') String name,
    @Default('') String language,
  }) = _QoriModel;

  factory QoriModel.fromJson(Map<String, dynamic> json) =>
      _$QoriModelFromJson(json);
}
