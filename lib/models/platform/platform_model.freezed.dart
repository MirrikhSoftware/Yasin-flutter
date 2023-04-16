// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'platform_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PlatformModel _$PlatformModelFromJson(Map<String, dynamic> json) {
  return _PlatformModel.fromJson(json);
}

/// @nodoc
mixin _$PlatformModel {
  PlatformEnum get platform => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get link => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlatformModelCopyWith<PlatformModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlatformModelCopyWith<$Res> {
  factory $PlatformModelCopyWith(
          PlatformModel value, $Res Function(PlatformModel) then) =
      _$PlatformModelCopyWithImpl<$Res, PlatformModel>;
  @useResult
  $Res call({PlatformEnum platform, String id, String link, double rating});
}

/// @nodoc
class _$PlatformModelCopyWithImpl<$Res, $Val extends PlatformModel>
    implements $PlatformModelCopyWith<$Res> {
  _$PlatformModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? platform = null,
    Object? id = null,
    Object? link = null,
    Object? rating = null,
  }) {
    return _then(_value.copyWith(
      platform: null == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as PlatformEnum,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PlatformModelCopyWith<$Res>
    implements $PlatformModelCopyWith<$Res> {
  factory _$$_PlatformModelCopyWith(
          _$_PlatformModel value, $Res Function(_$_PlatformModel) then) =
      __$$_PlatformModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PlatformEnum platform, String id, String link, double rating});
}

/// @nodoc
class __$$_PlatformModelCopyWithImpl<$Res>
    extends _$PlatformModelCopyWithImpl<$Res, _$_PlatformModel>
    implements _$$_PlatformModelCopyWith<$Res> {
  __$$_PlatformModelCopyWithImpl(
      _$_PlatformModel _value, $Res Function(_$_PlatformModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? platform = null,
    Object? id = null,
    Object? link = null,
    Object? rating = null,
  }) {
    return _then(_$_PlatformModel(
      platform: null == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as PlatformEnum,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PlatformModel implements _PlatformModel {
  _$_PlatformModel(
      {required this.platform,
      this.id = "",
      this.link = "",
      this.rating = 5.0});

  factory _$_PlatformModel.fromJson(Map<String, dynamic> json) =>
      _$$_PlatformModelFromJson(json);

  @override
  final PlatformEnum platform;
  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String link;
  @override
  @JsonKey()
  final double rating;

  @override
  String toString() {
    return 'PlatformModel(platform: $platform, id: $id, link: $link, rating: $rating)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlatformModel &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.rating, rating) || other.rating == rating));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, platform, id, link, rating);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PlatformModelCopyWith<_$_PlatformModel> get copyWith =>
      __$$_PlatformModelCopyWithImpl<_$_PlatformModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PlatformModelToJson(
      this,
    );
  }
}

abstract class _PlatformModel implements PlatformModel {
  factory _PlatformModel(
      {required final PlatformEnum platform,
      final String id,
      final String link,
      final double rating}) = _$_PlatformModel;

  factory _PlatformModel.fromJson(Map<String, dynamic> json) =
      _$_PlatformModel.fromJson;

  @override
  PlatformEnum get platform;
  @override
  String get id;
  @override
  String get link;
  @override
  double get rating;
  @override
  @JsonKey(ignore: true)
  _$$_PlatformModelCopyWith<_$_PlatformModel> get copyWith =>
      throw _privateConstructorUsedError;
}
