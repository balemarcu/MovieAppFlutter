// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourite_movies_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FavouriteMoviesStore on _FavouriteMoviesStore, Store {
  late final _$favoriteMoviesAtom =
      Atom(name: '_FavouriteMoviesStore.favoriteMovies', context: context);

  @override
  ObservableList<MovieModelMock> get favoriteMovies {
    _$favoriteMoviesAtom.reportRead();
    return super.favoriteMovies;
  }

  @override
  set favoriteMovies(ObservableList<MovieModelMock> value) {
    _$favoriteMoviesAtom.reportWrite(value, super.favoriteMovies, () {
      super.favoriteMovies = value;
    });
  }

  late final _$_FavouriteMoviesStoreActionController =
      ActionController(name: '_FavouriteMoviesStore', context: context);

  @override
  void add(MovieModelMock movie) {
    final _$actionInfo = _$_FavouriteMoviesStoreActionController.startAction(
        name: '_FavouriteMoviesStore.add');
    try {
      return super.add(movie);
    } finally {
      _$_FavouriteMoviesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeAll() {
    final _$actionInfo = _$_FavouriteMoviesStoreActionController.startAction(
        name: '_FavouriteMoviesStore.removeAll');
    try {
      return super.removeAll();
    } finally {
      _$_FavouriteMoviesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void remove(MovieModelMock movie) {
    final _$actionInfo = _$_FavouriteMoviesStoreActionController.startAction(
        name: '_FavouriteMoviesStore.remove');
    try {
      return super.remove(movie);
    } finally {
      _$_FavouriteMoviesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
favoriteMovies: ${favoriteMovies}
    ''';
  }
}
