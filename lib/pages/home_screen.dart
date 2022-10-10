import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List moviePosters = [
    "https://www.indiewire.com/wp-content/uploads/2019/12/ad-astra.jpg?w=500",
    "https://www.indiewire.com/wp-content/uploads/2019/12/beach_bum.jpg?w=510",
    "https://www.indiewire.com/wp-content/uploads/2019/12/dark-phoenix.jpg?w=856",
  ];

  final _pageController = PageController();
  int _currentIndex = 0;

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
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: ListView.builder(
        padding: const EdgeInsets.only(top: 16),
        scrollDirection: Axis.vertical,
        itemCount: 6,
        itemBuilder: (context, index) {
          if (index == 0) {
            // return PageView(
            //   controller: _pageController,
            //   children: [
            //     // Container(
            //     //   height: 200,
            //     //   width: 400,
            //     //   child: Image.asset(
            //     //     'lib/images/carousel_placeholder.png',
            //     //     fit: BoxFit.fill,
            //     //   ),
            //     //),
            //     // Image.asset('lib/images/carousel_placeholder.png',
            //     //     fit: BoxFit.fill)
            //   ],
            // );
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
            return SizedBox(
              height: 170,
              //width: 200,
              child: ListView.builder(
                  itemCount: moviePosters.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext ctx, int index) {
                    //Image.asset('lib/icons/top_rated.png'),
                    return Image.network(moviePosters[index]);
                  }),
            );
          } else {
            return const HomeScreenCategory(
              title: 'Coming soon',
            );
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_alarm),
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
