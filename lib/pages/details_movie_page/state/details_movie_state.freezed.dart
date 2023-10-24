// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'details_movie_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DetailsMovieState _$DetailsMovieStateFromJson(Map<String, dynamic> json) {
  return _DetailsMovieState.fromJson(json);
}

/// @nodoc
mixin _$DetailsMovieState {
  MovieModel? get selectedMovie => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetailsMovieStateCopyWith<DetailsMovieState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailsMovieStateCopyWith<$Res> {
  factory $DetailsMovieStateCopyWith(
          DetailsMovieState value, $Res Function(DetailsMovieState) then) =
      _$DetailsMovieStateCopyWithImpl<$Res, DetailsMovieState>;
  @useResult
  $Res call({MovieModel? selectedMovie});

  $MovieModelCopyWith<$Res>? get selectedMovie;
}

/// @nodoc
class _$DetailsMovieStateCopyWithImpl<$Res, $Val extends DetailsMovieState>
    implements $DetailsMovieStateCopyWith<$Res> {
  _$DetailsMovieStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedMovie = freezed,
  }) {
    return _then(_value.copyWith(
      selectedMovie: freezed == selectedMovie
          ? _value.selectedMovie
          : selectedMovie // ignore: cast_nullable_to_non_nullable
              as MovieModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MovieModelCopyWith<$Res>? get selectedMovie {
    if (_value.selectedMovie == null) {
      return null;
    }

    return $MovieModelCopyWith<$Res>(_value.selectedMovie!, (value) {
      return _then(_value.copyWith(selectedMovie: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DetailsMovieStateImplCopyWith<$Res>
    implements $DetailsMovieStateCopyWith<$Res> {
  factory _$$DetailsMovieStateImplCopyWith(_$DetailsMovieStateImpl value,
          $Res Function(_$DetailsMovieStateImpl) then) =
      __$$DetailsMovieStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({MovieModel? selectedMovie});

  @override
  $MovieModelCopyWith<$Res>? get selectedMovie;
}

/// @nodoc
class __$$DetailsMovieStateImplCopyWithImpl<$Res>
    extends _$DetailsMovieStateCopyWithImpl<$Res, _$DetailsMovieStateImpl>
    implements _$$DetailsMovieStateImplCopyWith<$Res> {
  __$$DetailsMovieStateImplCopyWithImpl(_$DetailsMovieStateImpl _value,
      $Res Function(_$DetailsMovieStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedMovie = freezed,
  }) {
    return _then(_$DetailsMovieStateImpl(
      selectedMovie: freezed == selectedMovie
          ? _value.selectedMovie
          : selectedMovie // ignore: cast_nullable_to_non_nullable
              as MovieModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailsMovieStateImpl implements _DetailsMovieState {
  const _$DetailsMovieStateImpl({required this.selectedMovie});

  factory _$DetailsMovieStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailsMovieStateImplFromJson(json);

  @override
  final MovieModel? selectedMovie;

  @override
  String toString() {
    return 'DetailsMovieState(selectedMovie: $selectedMovie)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailsMovieStateImpl &&
            (identical(other.selectedMovie, selectedMovie) ||
                other.selectedMovie == selectedMovie));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, selectedMovie);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailsMovieStateImplCopyWith<_$DetailsMovieStateImpl> get copyWith =>
      __$$DetailsMovieStateImplCopyWithImpl<_$DetailsMovieStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailsMovieStateImplToJson(
      this,
    );
  }
}

abstract class _DetailsMovieState implements DetailsMovieState {
  const factory _DetailsMovieState({required final MovieModel? selectedMovie}) =
      _$DetailsMovieStateImpl;

  factory _DetailsMovieState.fromJson(Map<String, dynamic> json) =
      _$DetailsMovieStateImpl.fromJson;

  @override
  MovieModel? get selectedMovie;
  @override
  @JsonKey(ignore: true)
  _$$DetailsMovieStateImplCopyWith<_$DetailsMovieStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
