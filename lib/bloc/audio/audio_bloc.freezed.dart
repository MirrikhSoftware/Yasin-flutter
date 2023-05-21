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
    required TResult Function() toNext,
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
    TResult? Function()? toNext,
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
    TResult Function()? toNext,
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
abstract class _$$_StartedCopyWith<$Res> {
  factory _$$_StartedCopyWith(
          _$_Started value, $Res Function(_$_Started) then) =
      __$$_StartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_StartedCopyWithImpl<$Res>
    extends _$AudioEventCopyWithImpl<$Res, _$_Started>
    implements _$$_StartedCopyWith<$Res> {
  __$$_StartedCopyWithImpl(_$_Started _value, $Res Function(_$_Started) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Started implements _Started {
  const _$_Started();

  @override
  String toString() {
    return 'AudioEvent.started()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Started);
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
    required TResult Function() toNext,
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
    TResult? Function()? toNext,
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
    TResult Function()? toNext,
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
  const factory _Started() = _$_Started;
}

/// @nodoc
abstract class _$$_PlayedCopyWith<$Res> {
  factory _$$_PlayedCopyWith(_$_Played value, $Res Function(_$_Played) then) =
      __$$_PlayedCopyWithImpl<$Res>;
  @useResult
  $Res call({int? index});
}

/// @nodoc
class __$$_PlayedCopyWithImpl<$Res>
    extends _$AudioEventCopyWithImpl<$Res, _$_Played>
    implements _$$_PlayedCopyWith<$Res> {
  __$$_PlayedCopyWithImpl(_$_Played _value, $Res Function(_$_Played) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = freezed,
  }) {
    return _then(_$_Played(
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_Played implements _Played {
  const _$_Played({this.index});

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
            other is _$_Played &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PlayedCopyWith<_$_Played> get copyWith =>
      __$$_PlayedCopyWithImpl<_$_Played>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(int? index) played,
    required TResult Function() paused,
    required TResult Function() stopped,
    required TResult Function() resumed,
    required TResult Function() toNext,
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
    TResult? Function()? toNext,
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
    TResult Function()? toNext,
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
  const factory _Played({final int? index}) = _$_Played;

  int? get index;
  @JsonKey(ignore: true)
  _$$_PlayedCopyWith<_$_Played> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_PausedCopyWith<$Res> {
  factory _$$_PausedCopyWith(_$_Paused value, $Res Function(_$_Paused) then) =
      __$$_PausedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_PausedCopyWithImpl<$Res>
    extends _$AudioEventCopyWithImpl<$Res, _$_Paused>
    implements _$$_PausedCopyWith<$Res> {
  __$$_PausedCopyWithImpl(_$_Paused _value, $Res Function(_$_Paused) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Paused implements _Paused {
  const _$_Paused();

  @override
  String toString() {
    return 'AudioEvent.paused()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Paused);
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
    required TResult Function() toNext,
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
    TResult? Function()? toNext,
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
    TResult Function()? toNext,
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
  const factory _Paused() = _$_Paused;
}

/// @nodoc
abstract class _$$_StoppedCopyWith<$Res> {
  factory _$$_StoppedCopyWith(
          _$_Stopped value, $Res Function(_$_Stopped) then) =
      __$$_StoppedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_StoppedCopyWithImpl<$Res>
    extends _$AudioEventCopyWithImpl<$Res, _$_Stopped>
    implements _$$_StoppedCopyWith<$Res> {
  __$$_StoppedCopyWithImpl(_$_Stopped _value, $Res Function(_$_Stopped) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Stopped implements _Stopped {
  const _$_Stopped();

  @override
  String toString() {
    return 'AudioEvent.stopped()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Stopped);
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
    required TResult Function() toNext,
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
    TResult? Function()? toNext,
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
    TResult Function()? toNext,
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
  const factory _Stopped() = _$_Stopped;
}

/// @nodoc
abstract class _$$_ResumedCopyWith<$Res> {
  factory _$$_ResumedCopyWith(
          _$_Resumed value, $Res Function(_$_Resumed) then) =
      __$$_ResumedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ResumedCopyWithImpl<$Res>
    extends _$AudioEventCopyWithImpl<$Res, _$_Resumed>
    implements _$$_ResumedCopyWith<$Res> {
  __$$_ResumedCopyWithImpl(_$_Resumed _value, $Res Function(_$_Resumed) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Resumed implements _Resumed {
  const _$_Resumed();

  @override
  String toString() {
    return 'AudioEvent.resumed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Resumed);
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
    required TResult Function() toNext,
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
    TResult? Function()? toNext,
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
    TResult Function()? toNext,
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
  const factory _Resumed() = _$_Resumed;
}

/// @nodoc
abstract class _$$_ToNextCopyWith<$Res> {
  factory _$$_ToNextCopyWith(_$_ToNext value, $Res Function(_$_ToNext) then) =
      __$$_ToNextCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ToNextCopyWithImpl<$Res>
    extends _$AudioEventCopyWithImpl<$Res, _$_ToNext>
    implements _$$_ToNextCopyWith<$Res> {
  __$$_ToNextCopyWithImpl(_$_ToNext _value, $Res Function(_$_ToNext) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ToNext implements _ToNext {
  const _$_ToNext();

  @override
  String toString() {
    return 'AudioEvent.toNext()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ToNext);
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
    required TResult Function() toNext,
    required TResult Function() toPrevious,
  }) {
    return toNext();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(int? index)? played,
    TResult? Function()? paused,
    TResult? Function()? stopped,
    TResult? Function()? resumed,
    TResult? Function()? toNext,
    TResult? Function()? toPrevious,
  }) {
    return toNext?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(int? index)? played,
    TResult Function()? paused,
    TResult Function()? stopped,
    TResult Function()? resumed,
    TResult Function()? toNext,
    TResult Function()? toPrevious,
    required TResult orElse(),
  }) {
    if (toNext != null) {
      return toNext();
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
  const factory _ToNext() = _$_ToNext;
}

/// @nodoc
abstract class _$$_ToPreviousCopyWith<$Res> {
  factory _$$_ToPreviousCopyWith(
          _$_ToPrevious value, $Res Function(_$_ToPrevious) then) =
      __$$_ToPreviousCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ToPreviousCopyWithImpl<$Res>
    extends _$AudioEventCopyWithImpl<$Res, _$_ToPrevious>
    implements _$$_ToPreviousCopyWith<$Res> {
  __$$_ToPreviousCopyWithImpl(
      _$_ToPrevious _value, $Res Function(_$_ToPrevious) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ToPrevious implements _ToPrevious {
  const _$_ToPrevious();

  @override
  String toString() {
    return 'AudioEvent.toPrevious()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ToPrevious);
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
    required TResult Function() toNext,
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
    TResult? Function()? toNext,
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
    TResult Function()? toNext,
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
  const factory _ToPrevious() = _$_ToPrevious;
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
abstract class _$$_AudioStateCopyWith<$Res>
    implements $AudioStateCopyWith<$Res> {
  factory _$$_AudioStateCopyWith(
          _$_AudioState value, $Res Function(_$_AudioState) then) =
      __$$_AudioStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PlayerStatus status, int currentPlaying});
}

/// @nodoc
class __$$_AudioStateCopyWithImpl<$Res>
    extends _$AudioStateCopyWithImpl<$Res, _$_AudioState>
    implements _$$_AudioStateCopyWith<$Res> {
  __$$_AudioStateCopyWithImpl(
      _$_AudioState _value, $Res Function(_$_AudioState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? currentPlaying = null,
  }) {
    return _then(_$_AudioState(
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

class _$_AudioState implements _AudioState {
  const _$_AudioState({required this.status, required this.currentPlaying});

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
            other is _$_AudioState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.currentPlaying, currentPlaying) ||
                other.currentPlaying == currentPlaying));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, currentPlaying);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AudioStateCopyWith<_$_AudioState> get copyWith =>
      __$$_AudioStateCopyWithImpl<_$_AudioState>(this, _$identity);
}

abstract class _AudioState implements AudioState {
  const factory _AudioState(
      {required final PlayerStatus status,
      required final int currentPlaying}) = _$_AudioState;

  @override
  PlayerStatus get status;
  @override
  int get currentPlaying;
  @override
  @JsonKey(ignore: true)
  _$$_AudioStateCopyWith<_$_AudioState> get copyWith =>
      throw _privateConstructorUsedError;
}
