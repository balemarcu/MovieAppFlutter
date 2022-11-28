// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_details_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MovieDetailsViewModel on _MovieDetailsViewModelBase, Store {
  Computed<bool>? _$isFavouriteComputed;

  @override
  bool get isFavourite =>
      (_$isFavouriteComputed ??= Computed<bool>(() => super.isFavourite,
              name: '_MovieDetailsViewModelBase.isFavourite'))
          .value;

  late final _$selectedMovieAtom =
      Atom(name: '_MovieDetailsViewModelBase.selectedMovie', context: context);

  @override
  Resource<Movie> get selectedMovie {
    _$selectedMovieAtom.reportRead();
    return super.selectedMovie;
  }

  @override
  set selectedMovie(Resource<Movie> value) {
    _$selectedMovieAtom.reportWrite(value, super.selectedMovie, () {
      super.selectedMovie = value;
    });
  }

  late final _$getMovieDetailsAsyncAction = AsyncAction(
      '_MovieDetailsViewModelBase.getMovieDetails',
      context: context);

  @override
  Future<void> getMovieDetails(int id) {
    return _$getMovieDetailsAsyncAction.run(() => super.getMovieDetails(id));
  }

  @override
  String toString() {
    return '''
selectedMovie: ${selectedMovie},
isFavourite: ${isFavourite}
    ''';
  }
}
