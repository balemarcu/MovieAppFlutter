import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      body: ListView(
        padding: const EdgeInsets.only(top: 10),
        children: [
          Image.asset(
            'lib/images/carousel_placeholder.png',
            fit: BoxFit.fill,
          ),
          const HomeScreenCategory(
            title: 'Stars',
          ),
          SizedBox(
            height: 75,
            //width: 200,
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) =>
                  Image.asset('lib/icons/star_icon.png'),
            ),
          ),
          const HomeScreenCategory(
            title: 'Top Rated Movies',
          ),
          SizedBox(
            height: 170,
            //width: 200,
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) =>
                  Image.asset('lib/icons/top_rated.png'),
            ),
          ),
          const HomeScreen()
        ],
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
