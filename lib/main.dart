import 'package:demo1/model/favoritesMovies.dart';
import 'package:demo1/pages/home_screen.dart';
import 'package:demo1/pages/movie_detail_page.dart';
import 'package:demo1/storage_module/storage_module.dart';
import 'package:flutter/material.dart';
import 'package:demo1/pages/login_page.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final StorageModule storageModule = StorageModule.getInstance();

  await storageModule.initModule();

  runApp(ChangeNotifierProvider(
    create: (context) => FavoritesModel(),
    child: const MyApp(),
  ));
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
  initialLocation: '/login',
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
);
