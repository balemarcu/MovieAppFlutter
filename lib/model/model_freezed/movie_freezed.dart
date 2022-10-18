import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'movie_freezed.freezed.dart';
part 'movie_freezed.g.dart';

@freezed
abstract class Movie with _$Movie {
  const factory Movie({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'posterPath') String? posterPath,
    @JsonKey(name: 'backdropPath') String? backdropPath,
    @JsonKey(name: 'overview') String? overview,
  }) = _Movie;

  factory Movie.fromJson(Map<String, Object?> json) => _$MovieFromJson(json);
}
