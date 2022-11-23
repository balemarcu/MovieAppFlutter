// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'movie_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MovieDetails {
  int get movieId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MovieDetailsCopyWith<MovieDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieDetailsCopyWith<$Res> {
  factory $MovieDetailsCopyWith(
          MovieDetails value, $Res Function(MovieDetails) then) =
      _$MovieDetailsCopyWithImpl<$Res, MovieDetails>;
  @useResult
  $Res call({int movieId, String title});
}

/// @nodoc
class _$MovieDetailsCopyWithImpl<$Res, $Val extends MovieDetails>
    implements $MovieDetailsCopyWith<$Res> {
  _$MovieDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movieId = null,
    Object? title = null,
  }) {
    return _then(_value.copyWith(
      movieId: null == movieId
          ? _value.movieId
          : movieId // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MovieDetailsCopyWith<$Res>
    implements $MovieDetailsCopyWith<$Res> {
  factory _$$_MovieDetailsCopyWith(
          _$_MovieDetails value, $Res Function(_$_MovieDetails) then) =
      __$$_MovieDetailsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int movieId, String title});
}

/// @nodoc
class __$$_MovieDetailsCopyWithImpl<$Res>
    extends _$MovieDetailsCopyWithImpl<$Res, _$_MovieDetails>
    implements _$$_MovieDetailsCopyWith<$Res> {
  __$$_MovieDetailsCopyWithImpl(
      _$_MovieDetails _value, $Res Function(_$_MovieDetails) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movieId = null,
    Object? title = null,
  }) {
    return _then(_$_MovieDetails(
      movieId: null == movieId
          ? _value.movieId
          : movieId // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_MovieDetails implements _MovieDetails {
  _$_MovieDetails({required this.movieId, required this.title});

  @override
  final int movieId;
  @override
  final String title;

  @override
  String toString() {
    return 'MovieDetails(movieId: $movieId, title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MovieDetails &&
            (identical(other.movieId, movieId) || other.movieId == movieId) &&
            (identical(other.title, title) || other.title == title));
  }

  @override
  int get hashCode => Object.hash(runtimeType, movieId, title);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MovieDetailsCopyWith<_$_MovieDetails> get copyWith =>
      __$$_MovieDetailsCopyWithImpl<_$_MovieDetails>(this, _$identity);
}

abstract class _MovieDetails implements MovieDetails {
  factory _MovieDetails(
      {required final int movieId,
      required final String title}) = _$_MovieDetails;

  @override
  int get movieId;
  @override
  String get title;
  @override
  @JsonKey(ignore: true)
  _$$_MovieDetailsCopyWith<_$_MovieDetails> get copyWith =>
      throw _privateConstructorUsedError;
}
