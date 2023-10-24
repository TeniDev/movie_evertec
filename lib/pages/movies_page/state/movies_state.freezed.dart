// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movies_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MoviesState _$MoviesStateFromJson(Map<String, dynamic> json) {
  return _MoviesState.fromJson(json);
}

/// @nodoc
mixin _$MoviesState {
  List<MovieModel>? get movies => throw _privateConstructorUsedError;
  double get currentMovieIndex => throw _privateConstructorUsedError;
  int get currentPageRequested => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MoviesStateCopyWith<MoviesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoviesStateCopyWith<$Res> {
  factory $MoviesStateCopyWith(
          MoviesState value, $Res Function(MoviesState) then) =
      _$MoviesStateCopyWithImpl<$Res, MoviesState>;
  @useResult
  $Res call(
      {List<MovieModel>? movies,
      double currentMovieIndex,
      int currentPageRequested});
}

/// @nodoc
class _$MoviesStateCopyWithImpl<$Res, $Val extends MoviesState>
    implements $MoviesStateCopyWith<$Res> {
  _$MoviesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movies = freezed,
    Object? currentMovieIndex = null,
    Object? currentPageRequested = null,
  }) {
    return _then(_value.copyWith(
      movies: freezed == movies
          ? _value.movies
          : movies // ignore: cast_nullable_to_non_nullable
              as List<MovieModel>?,
      currentMovieIndex: null == currentMovieIndex
          ? _value.currentMovieIndex
          : currentMovieIndex // ignore: cast_nullable_to_non_nullable
              as double,
      currentPageRequested: null == currentPageRequested
          ? _value.currentPageRequested
          : currentPageRequested // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MoviesStateImplCopyWith<$Res>
    implements $MoviesStateCopyWith<$Res> {
  factory _$$MoviesStateImplCopyWith(
          _$MoviesStateImpl value, $Res Function(_$MoviesStateImpl) then) =
      __$$MoviesStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<MovieModel>? movies,
      double currentMovieIndex,
      int currentPageRequested});
}

/// @nodoc
class __$$MoviesStateImplCopyWithImpl<$Res>
    extends _$MoviesStateCopyWithImpl<$Res, _$MoviesStateImpl>
    implements _$$MoviesStateImplCopyWith<$Res> {
  __$$MoviesStateImplCopyWithImpl(
      _$MoviesStateImpl _value, $Res Function(_$MoviesStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movies = freezed,
    Object? currentMovieIndex = null,
    Object? currentPageRequested = null,
  }) {
    return _then(_$MoviesStateImpl(
      movies: freezed == movies
          ? _value._movies
          : movies // ignore: cast_nullable_to_non_nullable
              as List<MovieModel>?,
      currentMovieIndex: null == currentMovieIndex
          ? _value.currentMovieIndex
          : currentMovieIndex // ignore: cast_nullable_to_non_nullable
              as double,
      currentPageRequested: null == currentPageRequested
          ? _value.currentPageRequested
          : currentPageRequested // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MoviesStateImpl implements _MoviesState {
  const _$MoviesStateImpl(
      {required final List<MovieModel>? movies,
      required this.currentMovieIndex,
      required this.currentPageRequested})
      : _movies = movies;

  factory _$MoviesStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$MoviesStateImplFromJson(json);

  final List<MovieModel>? _movies;
  @override
  List<MovieModel>? get movies {
    final value = _movies;
    if (value == null) return null;
    if (_movies is EqualUnmodifiableListView) return _movies;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final double currentMovieIndex;
  @override
  final int currentPageRequested;

  @override
  String toString() {
    return 'MoviesState(movies: $movies, currentMovieIndex: $currentMovieIndex, currentPageRequested: $currentPageRequested)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MoviesStateImpl &&
            const DeepCollectionEquality().equals(other._movies, _movies) &&
            (identical(other.currentMovieIndex, currentMovieIndex) ||
                other.currentMovieIndex == currentMovieIndex) &&
            (identical(other.currentPageRequested, currentPageRequested) ||
                other.currentPageRequested == currentPageRequested));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_movies),
      currentMovieIndex,
      currentPageRequested);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MoviesStateImplCopyWith<_$MoviesStateImpl> get copyWith =>
      __$$MoviesStateImplCopyWithImpl<_$MoviesStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MoviesStateImplToJson(
      this,
    );
  }
}

abstract class _MoviesState implements MoviesState {
  const factory _MoviesState(
      {required final List<MovieModel>? movies,
      required final double currentMovieIndex,
      required final int currentPageRequested}) = _$MoviesStateImpl;

  factory _MoviesState.fromJson(Map<String, dynamic> json) =
      _$MoviesStateImpl.fromJson;

  @override
  List<MovieModel>? get movies;
  @override
  double get currentMovieIndex;
  @override
  int get currentPageRequested;
  @override
  @JsonKey(ignore: true)
  _$$MoviesStateImplCopyWith<_$MoviesStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
