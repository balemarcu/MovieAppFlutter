// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MovieViewModel on _MovieViewModelBase, Store {
  Computed<bool>? _$isFavouriteComputed;

  @override
  bool get isFavourite =>
      (_$isFavouriteComputed ??= Computed<bool>(() => super.isFavourite,
              name: '_MovieViewModelBase.isFavourite'))
          .value;

  @override
  String toString() {
    return '''
isFavourite: ${isFavourite}
    ''';
  }
}
