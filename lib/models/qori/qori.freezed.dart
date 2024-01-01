// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qori.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QoriModel _$QoriModelFromJson(Map<String, dynamic> json) {
  return _QoriModel.fromJson(json);
}

/// @nodoc
mixin _$QoriModel {
  String get identifier => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get language => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QoriModelCopyWith<QoriModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QoriModelCopyWith<$Res> {
  factory $QoriModelCopyWith(QoriModel value, $Res Function(QoriModel) then) =
      _$QoriModelCopyWithImpl<$Res, QoriModel>;
  @useResult
  $Res call({String identifier, String name, String language});
}

/// @nodoc
class _$QoriModelCopyWithImpl<$Res, $Val extends QoriModel>
    implements $QoriModelCopyWith<$Res> {
  _$QoriModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? identifier = null,
    Object? name = null,
    Object? language = null,
  }) {
    return _then(_value.copyWith(
      identifier: null == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$QoriModelImplCopyWith<$Res>
    implements $QoriModelCopyWith<$Res> {
  factory _$$QoriModelImplCopyWith(
          _$QoriModelImpl value, $Res Function(_$QoriModelImpl) then) =
      __$$QoriModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String identifier, String name, String language});
}

/// @nodoc
class __$$QoriModelImplCopyWithImpl<$Res>
    extends _$QoriModelCopyWithImpl<$Res, _$QoriModelImpl>
    implements _$$QoriModelImplCopyWith<$Res> {
  __$$QoriModelImplCopyWithImpl(
      _$QoriModelImpl _value, $Res Function(_$QoriModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? identifier = null,
    Object? name = null,
    Object? language = null,
  }) {
    return _then(_$QoriModelImpl(
      identifier: null == identifier
          ? _value.identifier
          : identifier // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$QoriModelImpl implements _QoriModel {
  const _$QoriModelImpl(
      {this.identifier = '', this.name = '', this.language = ''});

  factory _$QoriModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$QoriModelImplFromJson(json);

  @override
  @JsonKey()
  final String identifier;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String language;

  @override
  String toString() {
    return 'QoriModel(identifier: $identifier, name: $name, language: $language)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QoriModelImpl &&
            (identical(other.identifier, identifier) ||
                other.identifier == identifier) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.language, language) ||
                other.language == language));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, identifier, name, language);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$QoriModelImplCopyWith<_$QoriModelImpl> get copyWith =>
      __$$QoriModelImplCopyWithImpl<_$QoriModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QoriModelImplToJson(
      this,
    );
  }
}

abstract class _QoriModel implements QoriModel {
  const factory _QoriModel(
      {final String identifier,
      final String name,
      final String language}) = _$QoriModelImpl;

  factory _QoriModel.fromJson(Map<String, dynamic> json) =
      _$QoriModelImpl.fromJson;

  @override
  String get identifier;
  @override
  String get name;
  @override
  String get language;
  @override
  @JsonKey(ignore: true)
  _$$QoriModelImplCopyWith<_$QoriModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
