// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audio_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AudioEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(int? index) played,
    required TResult Function() paused,
    required TResult Function() stopped,
    required TResult Function() resumed,
    required TResult Function(bool skip) toNext,
    required TResult Function() toPrevious,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(int? index)? played,
    TResult? Function()? paused,
    TResult? Function()? stopped,
    TResult? Function()? resumed,
    TResult? Function(bool skip)? toNext,
    TResult? Function()? toPrevious,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(int? index)? played,
    TResult Function()? paused,
    TResult Function()? stopped,
    TResult Function()? resumed,
    TResult Function(bool skip)? toNext,
    TResult Function()? toPrevious,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Played value) played,
    required TResult Function(_Paused value) paused,
    required TResult Function(_Stopped value) stopped,
    required TResult Function(_Resumed value) resumed,
    required TResult Function(_ToNext value) toNext,
    required TResult Function(_ToPrevious value) toPrevious,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Played value)? played,
    TResult? Function(_Paused value)? paused,
    TResult? Function(_Stopped value)? stopped,
    TResult? Function(_Resumed value)? resumed,
    TResult? Function(_ToNext value)? toNext,
    TResult? Function(_ToPrevious value)? toPrevious,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Played value)? played,
    TResult Function(_Paused value)? paused,
    TResult Function(_Stopped value)? stopped,
    TResult Function(_Resumed value)? resumed,
    TResult Function(_ToNext value)? toNext,
    TResult Function(_ToPrevious value)? toPrevious,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AudioEventCopyWith<$Res> {
  factory $AudioEventCopyWith(
          AudioEvent value, $Res Function(AudioEvent) then) =
      _$AudioEventCopyWithImpl<$Res, AudioEvent>;
}

/// @nodoc
class _$AudioEventCopyWithImpl<$Res, $Val extends AudioEvent>
    implements $AudioEventCopyWith<$Res> {
  _$AudioEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$AudioEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'AudioEvent.started()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(int? index) played,
    required TResult Function() paused,
    required TResult Function() stopped,
    required TResult Function() resumed,
    required TResult Function(bool skip) toNext,
    required TResult Function() toPrevious,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(int? index)? played,
    TResult? Function()? paused,
    TResult? Function()? stopped,
    TResult? Function()? resumed,
    TResult? Function(bool skip)? toNext,
    TResult? Function()? toPrevious,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(int? index)? played,
    TResult Function()? paused,
    TResult Function()? stopped,
    TResult Function()? resumed,
    TResult Function(bool skip)? toNext,
    TResult Function()? toPrevious,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Played value) played,
    required TResult Function(_Paused value) paused,
    required TResult Function(_Stopped value) stopped,
    required TResult Function(_Resumed value) resumed,
    required TResult Function(_ToNext value) toNext,
    required TResult Function(_ToPrevious value) toPrevious,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Played value)? played,
    TResult? Function(_Paused value)? paused,
    TResult? Function(_Stopped value)? stopped,
    TResult? Function(_Resumed value)? resumed,
    TResult? Function(_ToNext value)? toNext,
    TResult? Function(_ToPrevious value)? toPrevious,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Played value)? played,
    TResult Function(_Paused value)? paused,
    TResult Function(_Stopped value)? stopped,
    TResult Function(_Resumed value)? resumed,
    TResult Function(_ToNext value)? toNext,
    TResult Function(_ToPrevious value)? toPrevious,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements AudioEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$PlayedImplCopyWith<$Res> {
  factory _$$PlayedImplCopyWith(
          _$PlayedImpl value, $Res Function(_$PlayedImpl) then) =
      __$$PlayedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int? index});
}

/// @nodoc
class __$$PlayedImplCopyWithImpl<$Res>
    extends _$AudioEventCopyWithImpl<$Res, _$PlayedImpl>
    implements _$$PlayedImplCopyWith<$Res> {
  __$$PlayedImplCopyWithImpl(
      _$PlayedImpl _value, $Res Function(_$PlayedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = freezed,
  }) {
    return _then(_$PlayedImpl(
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$PlayedImpl implements _Played {
  const _$PlayedImpl({this.index});

  @override
  final int? index;

  @override
  String toString() {
    return 'AudioEvent.played(index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayedImpl &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayedImplCopyWith<_$PlayedImpl> get copyWith =>
      __$$PlayedImplCopyWithImpl<_$PlayedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(int? index) played,
    required TResult Function() paused,
    required TResult Function() stopped,
    required TResult Function() resumed,
    required TResult Function(bool skip) toNext,
    required TResult Function() toPrevious,
  }) {
    return played(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(int? index)? played,
    TResult? Function()? paused,
    TResult? Function()? stopped,
    TResult? Function()? resumed,
    TResult? Function(bool skip)? toNext,
    TResult? Function()? toPrevious,
  }) {
    return played?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(int? index)? played,
    TResult Function()? paused,
    TResult Function()? stopped,
    TResult Function()? resumed,
    TResult Function(bool skip)? toNext,
    TResult Function()? toPrevious,
    required TResult orElse(),
  }) {
    if (played != null) {
      return played(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Played value) played,
    required TResult Function(_Paused value) paused,
    required TResult Function(_Stopped value) stopped,
    required TResult Function(_Resumed value) resumed,
    required TResult Function(_ToNext value) toNext,
    required TResult Function(_ToPrevious value) toPrevious,
  }) {
    return played(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Played value)? played,
    TResult? Function(_Paused value)? paused,
    TResult? Function(_Stopped value)? stopped,
    TResult? Function(_Resumed value)? resumed,
    TResult? Function(_ToNext value)? toNext,
    TResult? Function(_ToPrevious value)? toPrevious,
  }) {
    return played?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Played value)? played,
    TResult Function(_Paused value)? paused,
    TResult Function(_Stopped value)? stopped,
    TResult Function(_Resumed value)? resumed,
    TResult Function(_ToNext value)? toNext,
    TResult Function(_ToPrevious value)? toPrevious,
    required TResult orElse(),
  }) {
    if (played != null) {
      return played(this);
    }
    return orElse();
  }
}

abstract class _Played implements AudioEvent {
  const factory _Played({final int? index}) = _$PlayedImpl;

  int? get index;
  @JsonKey(ignore: true)
  _$$PlayedImplCopyWith<_$PlayedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PausedImplCopyWith<$Res> {
  factory _$$PausedImplCopyWith(
          _$PausedImpl value, $Res Function(_$PausedImpl) then) =
      __$$PausedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PausedImplCopyWithImpl<$Res>
    extends _$AudioEventCopyWithImpl<$Res, _$PausedImpl>
    implements _$$PausedImplCopyWith<$Res> {
  __$$PausedImplCopyWithImpl(
      _$PausedImpl _value, $Res Function(_$PausedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PausedImpl implements _Paused {
  const _$PausedImpl();

  @override
  String toString() {
    return 'AudioEvent.paused()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PausedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(int? index) played,
    required TResult Function() paused,
    required TResult Function() stopped,
    required TResult Function() resumed,
    required TResult Function(bool skip) toNext,
    required TResult Function() toPrevious,
  }) {
    return paused();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(int? index)? played,
    TResult? Function()? paused,
    TResult? Function()? stopped,
    TResult? Function()? resumed,
    TResult? Function(bool skip)? toNext,
    TResult? Function()? toPrevious,
  }) {
    return paused?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(int? index)? played,
    TResult Function()? paused,
    TResult Function()? stopped,
    TResult Function()? resumed,
    TResult Function(bool skip)? toNext,
    TResult Function()? toPrevious,
    required TResult orElse(),
  }) {
    if (paused != null) {
      return paused();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Played value) played,
    required TResult Function(_Paused value) paused,
    required TResult Function(_Stopped value) stopped,
    required TResult Function(_Resumed value) resumed,
    required TResult Function(_ToNext value) toNext,
    required TResult Function(_ToPrevious value) toPrevious,
  }) {
    return paused(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Played value)? played,
    TResult? Function(_Paused value)? paused,
    TResult? Function(_Stopped value)? stopped,
    TResult? Function(_Resumed value)? resumed,
    TResult? Function(_ToNext value)? toNext,
    TResult? Function(_ToPrevious value)? toPrevious,
  }) {
    return paused?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Played value)? played,
    TResult Function(_Paused value)? paused,
    TResult Function(_Stopped value)? stopped,
    TResult Function(_Resumed value)? resumed,
    TResult Function(_ToNext value)? toNext,
    TResult Function(_ToPrevious value)? toPrevious,
    required TResult orElse(),
  }) {
    if (paused != null) {
      return paused(this);
    }
    return orElse();
  }
}

abstract class _Paused implements AudioEvent {
  const factory _Paused() = _$PausedImpl;
}

/// @nodoc
abstract class _$$StoppedImplCopyWith<$Res> {
  factory _$$StoppedImplCopyWith(
          _$StoppedImpl value, $Res Function(_$StoppedImpl) then) =
      __$$StoppedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StoppedImplCopyWithImpl<$Res>
    extends _$AudioEventCopyWithImpl<$Res, _$StoppedImpl>
    implements _$$StoppedImplCopyWith<$Res> {
  __$$StoppedImplCopyWithImpl(
      _$StoppedImpl _value, $Res Function(_$StoppedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StoppedImpl implements _Stopped {
  const _$StoppedImpl();

  @override
  String toString() {
    return 'AudioEvent.stopped()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StoppedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(int? index) played,
    required TResult Function() paused,
    required TResult Function() stopped,
    required TResult Function() resumed,
    required TResult Function(bool skip) toNext,
    required TResult Function() toPrevious,
  }) {
    return stopped();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(int? index)? played,
    TResult? Function()? paused,
    TResult? Function()? stopped,
    TResult? Function()? resumed,
    TResult? Function(bool skip)? toNext,
    TResult? Function()? toPrevious,
  }) {
    return stopped?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(int? index)? played,
    TResult Function()? paused,
    TResult Function()? stopped,
    TResult Function()? resumed,
    TResult Function(bool skip)? toNext,
    TResult Function()? toPrevious,
    required TResult orElse(),
  }) {
    if (stopped != null) {
      return stopped();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Played value) played,
    required TResult Function(_Paused value) paused,
    required TResult Function(_Stopped value) stopped,
    required TResult Function(_Resumed value) resumed,
    required TResult Function(_ToNext value) toNext,
    required TResult Function(_ToPrevious value) toPrevious,
  }) {
    return stopped(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Played value)? played,
    TResult? Function(_Paused value)? paused,
    TResult? Function(_Stopped value)? stopped,
    TResult? Function(_Resumed value)? resumed,
    TResult? Function(_ToNext value)? toNext,
    TResult? Function(_ToPrevious value)? toPrevious,
  }) {
    return stopped?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Played value)? played,
    TResult Function(_Paused value)? paused,
    TResult Function(_Stopped value)? stopped,
    TResult Function(_Resumed value)? resumed,
    TResult Function(_ToNext value)? toNext,
    TResult Function(_ToPrevious value)? toPrevious,
    required TResult orElse(),
  }) {
    if (stopped != null) {
      return stopped(this);
    }
    return orElse();
  }
}

abstract class _Stopped implements AudioEvent {
  const factory _Stopped() = _$StoppedImpl;
}

/// @nodoc
abstract class _$$ResumedImplCopyWith<$Res> {
  factory _$$ResumedImplCopyWith(
          _$ResumedImpl value, $Res Function(_$ResumedImpl) then) =
      __$$ResumedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResumedImplCopyWithImpl<$Res>
    extends _$AudioEventCopyWithImpl<$Res, _$ResumedImpl>
    implements _$$ResumedImplCopyWith<$Res> {
  __$$ResumedImplCopyWithImpl(
      _$ResumedImpl _value, $Res Function(_$ResumedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ResumedImpl implements _Resumed {
  const _$ResumedImpl();

  @override
  String toString() {
    return 'AudioEvent.resumed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResumedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(int? index) played,
    required TResult Function() paused,
    required TResult Function() stopped,
    required TResult Function() resumed,
    required TResult Function(bool skip) toNext,
    required TResult Function() toPrevious,
  }) {
    return resumed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(int? index)? played,
    TResult? Function()? paused,
    TResult? Function()? stopped,
    TResult? Function()? resumed,
    TResult? Function(bool skip)? toNext,
    TResult? Function()? toPrevious,
  }) {
    return resumed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(int? index)? played,
    TResult Function()? paused,
    TResult Function()? stopped,
    TResult Function()? resumed,
    TResult Function(bool skip)? toNext,
    TResult Function()? toPrevious,
    required TResult orElse(),
  }) {
    if (resumed != null) {
      return resumed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Played value) played,
    required TResult Function(_Paused value) paused,
    required TResult Function(_Stopped value) stopped,
    required TResult Function(_Resumed value) resumed,
    required TResult Function(_ToNext value) toNext,
    required TResult Function(_ToPrevious value) toPrevious,
  }) {
    return resumed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Played value)? played,
    TResult? Function(_Paused value)? paused,
    TResult? Function(_Stopped value)? stopped,
    TResult? Function(_Resumed value)? resumed,
    TResult? Function(_ToNext value)? toNext,
    TResult? Function(_ToPrevious value)? toPrevious,
  }) {
    return resumed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Played value)? played,
    TResult Function(_Paused value)? paused,
    TResult Function(_Stopped value)? stopped,
    TResult Function(_Resumed value)? resumed,
    TResult Function(_ToNext value)? toNext,
    TResult Function(_ToPrevious value)? toPrevious,
    required TResult orElse(),
  }) {
    if (resumed != null) {
      return resumed(this);
    }
    return orElse();
  }
}

abstract class _Resumed implements AudioEvent {
  const factory _Resumed() = _$ResumedImpl;
}

/// @nodoc
abstract class _$$ToNextImplCopyWith<$Res> {
  factory _$$ToNextImplCopyWith(
          _$ToNextImpl value, $Res Function(_$ToNextImpl) then) =
      __$$ToNextImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool skip});
}

/// @nodoc
class __$$ToNextImplCopyWithImpl<$Res>
    extends _$AudioEventCopyWithImpl<$Res, _$ToNextImpl>
    implements _$$ToNextImplCopyWith<$Res> {
  __$$ToNextImplCopyWithImpl(
      _$ToNextImpl _value, $Res Function(_$ToNextImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? skip = null,
  }) {
    return _then(_$ToNextImpl(
      skip: null == skip
          ? _value.skip
          : skip // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ToNextImpl implements _ToNext {
  const _$ToNextImpl({this.skip = false});

  @override
  @JsonKey()
  final bool skip;

  @override
  String toString() {
    return 'AudioEvent.toNext(skip: $skip)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToNextImpl &&
            (identical(other.skip, skip) || other.skip == skip));
  }

  @override
  int get hashCode => Object.hash(runtimeType, skip);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ToNextImplCopyWith<_$ToNextImpl> get copyWith =>
      __$$ToNextImplCopyWithImpl<_$ToNextImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(int? index) played,
    required TResult Function() paused,
    required TResult Function() stopped,
    required TResult Function() resumed,
    required TResult Function(bool skip) toNext,
    required TResult Function() toPrevious,
  }) {
    return toNext(skip);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(int? index)? played,
    TResult? Function()? paused,
    TResult? Function()? stopped,
    TResult? Function()? resumed,
    TResult? Function(bool skip)? toNext,
    TResult? Function()? toPrevious,
  }) {
    return toNext?.call(skip);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(int? index)? played,
    TResult Function()? paused,
    TResult Function()? stopped,
    TResult Function()? resumed,
    TResult Function(bool skip)? toNext,
    TResult Function()? toPrevious,
    required TResult orElse(),
  }) {
    if (toNext != null) {
      return toNext(skip);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Played value) played,
    required TResult Function(_Paused value) paused,
    required TResult Function(_Stopped value) stopped,
    required TResult Function(_Resumed value) resumed,
    required TResult Function(_ToNext value) toNext,
    required TResult Function(_ToPrevious value) toPrevious,
  }) {
    return toNext(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Played value)? played,
    TResult? Function(_Paused value)? paused,
    TResult? Function(_Stopped value)? stopped,
    TResult? Function(_Resumed value)? resumed,
    TResult? Function(_ToNext value)? toNext,
    TResult? Function(_ToPrevious value)? toPrevious,
  }) {
    return toNext?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Played value)? played,
    TResult Function(_Paused value)? paused,
    TResult Function(_Stopped value)? stopped,
    TResult Function(_Resumed value)? resumed,
    TResult Function(_ToNext value)? toNext,
    TResult Function(_ToPrevious value)? toPrevious,
    required TResult orElse(),
  }) {
    if (toNext != null) {
      return toNext(this);
    }
    return orElse();
  }
}

abstract class _ToNext implements AudioEvent {
  const factory _ToNext({final bool skip}) = _$ToNextImpl;

  bool get skip;
  @JsonKey(ignore: true)
  _$$ToNextImplCopyWith<_$ToNextImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ToPreviousImplCopyWith<$Res> {
  factory _$$ToPreviousImplCopyWith(
          _$ToPreviousImpl value, $Res Function(_$ToPreviousImpl) then) =
      __$$ToPreviousImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ToPreviousImplCopyWithImpl<$Res>
    extends _$AudioEventCopyWithImpl<$Res, _$ToPreviousImpl>
    implements _$$ToPreviousImplCopyWith<$Res> {
  __$$ToPreviousImplCopyWithImpl(
      _$ToPreviousImpl _value, $Res Function(_$ToPreviousImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ToPreviousImpl implements _ToPrevious {
  const _$ToPreviousImpl();

  @override
  String toString() {
    return 'AudioEvent.toPrevious()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ToPreviousImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(int? index) played,
    required TResult Function() paused,
    required TResult Function() stopped,
    required TResult Function() resumed,
    required TResult Function(bool skip) toNext,
    required TResult Function() toPrevious,
  }) {
    return toPrevious();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(int? index)? played,
    TResult? Function()? paused,
    TResult? Function()? stopped,
    TResult? Function()? resumed,
    TResult? Function(bool skip)? toNext,
    TResult? Function()? toPrevious,
  }) {
    return toPrevious?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(int? index)? played,
    TResult Function()? paused,
    TResult Function()? stopped,
    TResult Function()? resumed,
    TResult Function(bool skip)? toNext,
    TResult Function()? toPrevious,
    required TResult orElse(),
  }) {
    if (toPrevious != null) {
      return toPrevious();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_Played value) played,
    required TResult Function(_Paused value) paused,
    required TResult Function(_Stopped value) stopped,
    required TResult Function(_Resumed value) resumed,
    required TResult Function(_ToNext value) toNext,
    required TResult Function(_ToPrevious value) toPrevious,
  }) {
    return toPrevious(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_Played value)? played,
    TResult? Function(_Paused value)? paused,
    TResult? Function(_Stopped value)? stopped,
    TResult? Function(_Resumed value)? resumed,
    TResult? Function(_ToNext value)? toNext,
    TResult? Function(_ToPrevious value)? toPrevious,
  }) {
    return toPrevious?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_Played value)? played,
    TResult Function(_Paused value)? paused,
    TResult Function(_Stopped value)? stopped,
    TResult Function(_Resumed value)? resumed,
    TResult Function(_ToNext value)? toNext,
    TResult Function(_ToPrevious value)? toPrevious,
    required TResult orElse(),
  }) {
    if (toPrevious != null) {
      return toPrevious(this);
    }
    return orElse();
  }
}

abstract class _ToPrevious implements AudioEvent {
  const factory _ToPrevious() = _$ToPreviousImpl;
}

/// @nodoc
mixin _$AudioState {
  PlayerStatus get status => throw _privateConstructorUsedError;
  int get currentPlaying => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AudioStateCopyWith<AudioState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AudioStateCopyWith<$Res> {
  factory $AudioStateCopyWith(
          AudioState value, $Res Function(AudioState) then) =
      _$AudioStateCopyWithImpl<$Res, AudioState>;
  @useResult
  $Res call({PlayerStatus status, int currentPlaying});
}

/// @nodoc
class _$AudioStateCopyWithImpl<$Res, $Val extends AudioState>
    implements $AudioStateCopyWith<$Res> {
  _$AudioStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? currentPlaying = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PlayerStatus,
      currentPlaying: null == currentPlaying
          ? _value.currentPlaying
          : currentPlaying // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AudioStateImplCopyWith<$Res>
    implements $AudioStateCopyWith<$Res> {
  factory _$$AudioStateImplCopyWith(
          _$AudioStateImpl value, $Res Function(_$AudioStateImpl) then) =
      __$$AudioStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PlayerStatus status, int currentPlaying});
}

/// @nodoc
class __$$AudioStateImplCopyWithImpl<$Res>
    extends _$AudioStateCopyWithImpl<$Res, _$AudioStateImpl>
    implements _$$AudioStateImplCopyWith<$Res> {
  __$$AudioStateImplCopyWithImpl(
      _$AudioStateImpl _value, $Res Function(_$AudioStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? currentPlaying = null,
  }) {
    return _then(_$AudioStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PlayerStatus,
      currentPlaying: null == currentPlaying
          ? _value.currentPlaying
          : currentPlaying // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$AudioStateImpl implements _AudioState {
  const _$AudioStateImpl({required this.status, required this.currentPlaying});

  @override
  final PlayerStatus status;
  @override
  final int currentPlaying;

  @override
  String toString() {
    return 'AudioState(status: $status, currentPlaying: $currentPlaying)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AudioStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.currentPlaying, currentPlaying) ||
                other.currentPlaying == currentPlaying));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, currentPlaying);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AudioStateImplCopyWith<_$AudioStateImpl> get copyWith =>
      __$$AudioStateImplCopyWithImpl<_$AudioStateImpl>(this, _$identity);
}

abstract class _AudioState implements AudioState {
  const factory _AudioState(
      {required final PlayerStatus status,
      required final int currentPlaying}) = _$AudioStateImpl;

  @override
  PlayerStatus get status;
  @override
  int get currentPlaying;
  @override
  @JsonKey(ignore: true)
  _$$AudioStateImplCopyWith<_$AudioStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
