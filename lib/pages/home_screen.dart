import 'package:demo1/api/endpoints.dart';
import 'package:demo1/model/favoritesMovies.dart';
import 'package:demo1/model/movie_model_mock.dart';
import 'package:demo1/pages/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _pageController = PageController();
  int _currentIndex = 0;
  late final List<Widget> tabsList;

  List<Image> pageViewImages = [
    Image.asset(
      'lib/images/carousel_placeholder.png',
      fit: BoxFit.fill,
    ),
    Image.asset('lib/images/carousel_placeholder.png', fit: BoxFit.fill)
  ];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      print('page changed');
      print(_pageController.page?.toInt());
    });

    tabsList = [
      const HomeTab(),
      const FavoritesTab(),
    ];
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<FavoritesModel>(context, listen: false).add(
              MovieModelMock(
                  id: 1, name: 'Movie 1', posterPath: 'bla bla bla'));
        },
      ),
      appBar: AppBar(
        title: const Text('Homescreen'),
        backgroundColor: Colors.red,
        leading: Image.asset('lib/icons/user_icon.png'),
        actions: [
          IconButton(
              onPressed: () {
                print('AppBar search button pressed');
              },
              icon: const Icon(Icons.search))
        ],
      ),
      //body: HomeTabWidget(moviePosters: moviePosters),
      body: tabsList.elementAt(_currentIndex),
      //TODO nested navigation
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                Icon(Icons.access_alarm),
                Consumer<FavoritesModel>(builder: ((context, value, child) {
                  return Text(value.favoritesMovies.length.toString());
                }))
              ],
            ),
            label: 'Favorites',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

class HomeTab extends StatelessWidget {
  const HomeTab({
    Key? key,
    //required this.moviePosters,
  }) : super(key: key);

  //final List moviePosters;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 16),
      scrollDirection: Axis.vertical,
      itemCount: 6,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Image.asset(
            // TODO use view page
            'lib/images/carousel_placeholder.png',
            fit: BoxFit.fill,
          );
          // return PageView.builder(
          //     itemCount: 3,
          //     itemBuilder: (context, index) {
          //       // return Container(
          //       //   width: double.infinity,
          //       //   height: 400,
          //       //   color: index % 2 == 0 ? Colors.green : Colors.blue[700],
          //       // );
          //     });
        } else if (index == 1) {
          return const HomeScreenCategory(
            title: 'Stars',
          );
        } else if (index == 2) {
          return SizedBox(
            height: 75,
            //width: 200,
            child: ListView.builder(
              itemCount: 6,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) =>
                  Image.asset('lib/icons/star_icon.png'),
            ),
          );
        } else if (index == 3) {
          return const HomeScreenCategory(
            title: 'Popular',
          );
        } else if (index == 4) {
          // return SizedBox(
          //   height: 170,
          //   //width: 200,
          //   child: ListView.builder(
          //       itemCount: movies.length,
          //       scrollDirection: Axis.horizontal,
          //       itemBuilder: (BuildContext ctx, int index) {
          //         //Image.asset('lib/icons/top_rated.png'),
          //         final selectedMovie = movies[index];
          //         return GestureDetector(
          //           onTap: () {
          //             context.goNamed('movieDetail', params: <String, String>{
          //               'movieId': selectedMovie.id.toString()
          //             });
          //           },
          //           child: Image.network(selectedMovie.posterPath),
          //         );
          //         //return Image.network(moviePosters[index]);
          //       }),
          // );
          return ScrollingMovies(
            title: 'Popular',
            api: Endpoints.popularMoviesUrl(1),
          );
        } else {
          return const HomeScreenCategory(
            title: 'Coming soon',
          );
        }
      },
    );
  }
}

class FavoritesTab extends StatefulWidget {
  const FavoritesTab({super.key});

  @override
  State<FavoritesTab> createState() => _FavoritesTabState();
}

class _FavoritesTabState extends State<FavoritesTab> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FavoritesModel>(builder: (context, value, child) {
      return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: value.favoritesMovies.length,
        itemBuilder: (context, index) {
          return Text(value.favoritesMovies[index].name);
        },
      );
    });
  }
}

class HomeScreenCategory extends StatelessWidget {
  final String title;

  const HomeScreenCategory({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        constraints: const BoxConstraints(minWidth: 72),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(8), bottomRight: Radius.circular(8)),
          color: Colors.red,
        ),
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
