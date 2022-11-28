import 'dart:async';
import 'dart:developer';

//import 'package:demo1/injector/injector.dart';
import 'package:demo1/auth/data/get_request_token_api.dart';
//import 'package:demo1/login/login_api_request.dart';
import 'package:demo1/auth/data/login_repository.dart';
import 'package:demo1/auth/presentation/login_view_model.dart';
//import 'package:demo1/login/session_token_api.dart';
//import 'package:demo1/model/favoritesMovies.dart';
import 'package:demo1/movies/data/dao/movie_dao.dart';
import 'package:demo1/movies/data/api/movies_api.dart';
import 'package:demo1/movies/data/repository/movies_repository.dart';
import 'package:demo1/movies/presentation/movie_list_view_model.dart';
import 'package:demo1/core/network/networking.dart';
//import 'package:demo1/core/widget/home_screen.dart';
import 'package:demo1/movies/presentation/movie_detail_page.dart';
//import 'package:demo1/storage_module/app_database/app_database.dart';
import 'package:demo1/core/storage/storage_module.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
//import 'package:demo1/pages/login_page.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

//import 'core/injector/injector.dart';
import 'core/injector.dart';
import 'core/widgets/home_screen.dart';
import 'core/widgets/login_page.dart';
import 'mobx/model/favoritesMovies.dart';

//GetIt getIt = GetIt.instance;
Future<void> main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    await registerModules();
    await configureInjection();
    runApp(ChangeNotifierProvider(
      create: (context) => FavoritesModel(),
      child: const MyApp(),
    ));
  }, (Object error, StackTrace stackTrace) {
    log('zone error', error: error, stackTrace: stackTrace);
  });
}

Future<void> registerModules() async {
  // final StorageModule storageModule = await StorageModule();

  //await storageModule.createModule();

  // getIt.registerSingleton<AppDatabase>(storageModule.db);

  // getIt.registerSingleton<SharedPreferences>(storageModule.sharedPreferences);

  // getIt.registerSingleton<MovieDao>(MovieDao(getIt<AppDatabase>()));

  //getIt.registerSingleton<NetworkModule>(NetworkModule());

  // //final NetworkModule networkModule = NetworkModule(); todo

  // getIt.registerSingleton<MoviesApi>(MoviesApi(getIt<NetworkModule>()));

  // //Movie repository
  // getIt.registerSingleton<MovieRepository>(
  //     MovieRepository(getIt<MoviesApi>(), getIt<MovieDao>()));

  // getIt.registerFactory<MoviesViewModel>(
  //     () => MoviesViewModel(getIt<MovieRepository>()));

  //--------
  //Login

  // getIt.registerSingleton<GetRequestTokenApi>(
  //     GetRequestTokenApi(getIt<NetworkModule>()));

  // getIt.registerSingleton<SessionTokenApi>(
  //     SessionTokenApi(getIt<NetworkModule>()));

  //getIt.registerSingleton<LoginApi>(LoginApi(getIt<NetworkModule>()));

  // getIt.registerSingleton<LoginRepository>(LoginRepository(
  //     getIt<LoginApi>(),
  //     getIt<GetRequestTokenApi>(),
  //     getIt<SessionTokenApi>(),
  //     getIt<SharedPreferences>()));

  // getIt.registerFactory<LoginViewModel>(
  //     () => LoginViewModel(getIt<LoginRepository>()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 247, 192, 74),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 247, 192, 74))),
        inputDecorationTheme: const InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(width: 1, color: Colors.green),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      name: 'login',
      path: '/login',
      builder: (context, state) {
        return const LogInPage();
      },
      //routes: []
    ),
    GoRoute(
        name: 'homescreen',
        path: '/',
        builder: (context, state) => const HomeScreen(),
        routes: [
          GoRoute(
              name: 'movieDetail',
              path: 'details/:movieId',
              builder: ((context, state) {
                return MovieDetails(id: int.parse(state.params['movieId']!));
              })),
        ]),
    // GoRoute(
    //     name: 'movieDetail',
    //     path: '/details/:movieId',
    //     builder: ((context, state) {
    //       return MovieDetails(id: int.parse(state.params['movieId']!));
    //     })),
  ],
  redirect: (context, state) async {
    final loginRepository = getIt<LoginRepository>();
    if (state.location != '/login' && !await loginRepository.checkAuth()) {
      print('logged in failed');
      return '/login';
    } else {
      print('logged in');
      return null;
      //return null;
    }
  },
);
