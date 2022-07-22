import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/pages/homepage.dart';
import '../constants/my_icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var items = [];

  int _currentIndex = 2;
  late final PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: _currentIndex);
    super.initState();
    // _getAllProductDetail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ecom',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: [
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.blue,
          ),
          const HomePage(),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.blue,
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        // color: Colors.white,
        shape: const CircularNotchedRectangle(),
        notchMargin: 0.01,
        clipBehavior: Clip.antiAlias,
        child: Container(
          height: kBottomNavigationBarHeight * 0.98,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(
                  color: Colors.grey,
                  width: 0.5,
                ),
              ),
            ),
            child: BottomNavigationBar(
              // onTap: initState,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(EvaIcons.home),
                  // title: Text('Home'),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                    activeIcon: null, icon: Icon(null), label: 'Search'),
                BottomNavigationBarItem(
                    icon: Icon(
                      EvaIcons.alertTriangleOutline,
                    ),
                    label: 'Cart'),
                BottomNavigationBarItem(
                    icon: Icon(EvaIcons.arrowBack), label: 'User'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
