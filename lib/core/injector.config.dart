// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i13;

import '../auth/data/get_request_token_api.dart' as _i7;
import '../auth/data/login_api_request.dart' as _i8;
import '../auth/data/login_repository.dart' as _i14;
import '../auth/data/session_token_api.dart' as _i12;
import '../auth/presentation/login_view_model.dart' as _i15;
import '../movie_favourites/data/dao/favourites_movies_dao.dart' as _i5;
import '../movie_favourites/data/repository/favorites_movies_repository.dart'
    as _i6;
import '../movies/data/api/movies_api.dart' as _i11;
import '../movies/data/dao/movie_dao.dart' as _i9;
import '../movies/data/repository/movies_repository.dart' as _i16;
import '../movies/presentation/movie_details_view_model.dart' as _i17;
import '../movies/presentation/movie_list_view_model.dart' as _i18;
import '../movies/presentation/movie_view_model.dart' as _i10;
import 'network/networking.dart' as _i20;
import 'storage/app_database/app_database.dart' as _i3;
import 'storage/storage_module.dart'
    as _i19; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final storageModule = _$StorageModule();
  final networkModule = _$NetworkModule();
  gh.lazySingleton<_i3.AppDatabase>(() => storageModule.db);
  gh.lazySingleton<_i4.Dio>(() => networkModule.dio);
  gh.lazySingleton<_i5.FavouritesMoviesDao>(
      () => _i5.FavouritesMoviesDao(get<_i3.AppDatabase>()));
  gh.lazySingleton<_i6.FavouritesMoviesRepository>(
      () => _i6.FavouritesMoviesRepository(get<_i5.FavouritesMoviesDao>()));
  gh.lazySingleton<_i7.GetRequestTokenApi>(
      () => _i7.GetRequestTokenApi(get<_i4.Dio>()));
  gh.lazySingleton<_i8.LoginApi>(() => _i8.LoginApi(get<_i4.Dio>()));
  gh.lazySingleton<_i9.MovieDao>(() => _i9.MovieDao(get<_i3.AppDatabase>()));
  gh.factoryParam<_i10.MovieViewModel, int, dynamic>((
    movieId,
    _,
  ) =>
      _i10.MovieViewModel(
        get<_i6.FavouritesMoviesRepository>(),
        movieId,
      ));
  gh.lazySingleton<_i11.MoviesApi>(() => _i11.MoviesApi(get<_i4.Dio>()));
  gh.lazySingleton<_i12.SessionTokenApi>(
      () => _i12.SessionTokenApi(get<_i4.Dio>()));
  await gh.factoryAsync<_i13.SharedPreferences>(
    () => storageModule.prefs,
    preResolve: true,
  );
  gh.lazySingleton<_i14.LoginRepository>(() => _i14.LoginRepository(
        get<_i8.LoginApi>(),
        get<_i7.GetRequestTokenApi>(),
        get<_i12.SessionTokenApi>(),
        get<_i13.SharedPreferences>(),
      ));
  gh.factory<_i15.LoginViewModel>(
      () => _i15.LoginViewModel(get<_i14.LoginRepository>()));
  gh.lazySingleton<_i16.MovieRepository>(() => _i16.MovieRepository(
        get<_i11.MoviesApi>(),
        get<_i9.MovieDao>(),
      ));
  gh.factoryParam<_i17.MovieDetailsViewModel, int, dynamic>((
    movieId,
    _,
  ) =>
      _i17.MovieDetailsViewModel(
        get<_i16.MovieRepository>(),
        get<_i6.FavouritesMoviesRepository>(),
        movieId,
      ));
  gh.factory<_i18.MovieListViewModel>(
      () => _i18.MovieListViewModel(get<_i16.MovieRepository>()));
  return get;
}

class _$StorageModule extends _i19.StorageModule {}

class _$NetworkModule extends _i20.NetworkModule {}
