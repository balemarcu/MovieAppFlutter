import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_details.freezed.dart';

@freezed
class FavouritesMovie with _$FavouritesMovie {
  factory FavouritesMovie({
    required int movieId,
  }) = _FavouritesMovie;
}
