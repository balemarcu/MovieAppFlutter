import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_details.freezed.dart';

@freezed
class MovieDetails with _$MovieDetails {
  factory MovieDetails({
    required int movieId,
    required String title,
  }) = _MovieDetails;
}
