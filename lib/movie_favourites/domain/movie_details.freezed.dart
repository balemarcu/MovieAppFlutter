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
mixin _$FavouritesMovie {
  int get movieId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FavouritesMovieCopyWith<FavouritesMovie> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavouritesMovieCopyWith<$Res> {
  factory $FavouritesMovieCopyWith(
          FavouritesMovie value, $Res Function(FavouritesMovie) then) =
      _$FavouritesMovieCopyWithImpl<$Res, FavouritesMovie>;
  @useResult
  $Res call({int movieId});
}

/// @nodoc
class _$FavouritesMovieCopyWithImpl<$Res, $Val extends FavouritesMovie>
    implements $FavouritesMovieCopyWith<$Res> {
  _$FavouritesMovieCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movieId = null,
  }) {
    return _then(_value.copyWith(
      movieId: null == movieId
          ? _value.movieId
          : movieId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FavouritesMovieCopyWith<$Res>
    implements $FavouritesMovieCopyWith<$Res> {
  factory _$$_FavouritesMovieCopyWith(
          _$_FavouritesMovie value, $Res Function(_$_FavouritesMovie) then) =
      __$$_FavouritesMovieCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int movieId});
}

/// @nodoc
class __$$_FavouritesMovieCopyWithImpl<$Res>
    extends _$FavouritesMovieCopyWithImpl<$Res, _$_FavouritesMovie>
    implements _$$_FavouritesMovieCopyWith<$Res> {
  __$$_FavouritesMovieCopyWithImpl(
      _$_FavouritesMovie _value, $Res Function(_$_FavouritesMovie) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movieId = null,
  }) {
    return _then(_$_FavouritesMovie(
      movieId: null == movieId
          ? _value.movieId
          : movieId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_FavouritesMovie implements _FavouritesMovie {
  _$_FavouritesMovie({required this.movieId});

  @override
  final int movieId;

  @override
  String toString() {
    return 'FavouritesMovie(movieId: $movieId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FavouritesMovie &&
            (identical(other.movieId, movieId) || other.movieId == movieId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, movieId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FavouritesMovieCopyWith<_$_FavouritesMovie> get copyWith =>
      __$$_FavouritesMovieCopyWithImpl<_$_FavouritesMovie>(this, _$identity);
}

abstract class _FavouritesMovie implements FavouritesMovie {
  factory _FavouritesMovie({required final int movieId}) = _$_FavouritesMovie;

  @override
  int get movieId;
  @override
  @JsonKey(ignore: true)
  _$$_FavouritesMovieCopyWith<_$_FavouritesMovie> get copyWith =>
      throw _privateConstructorUsedError;
}
