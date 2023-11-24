import 'package:ecommerceapp/ui/screen/home_page_screen.dart';
import 'package:ecommerceapp/ui/screen/add_product_screen.dart';
import 'package:ecommerceapp/ui/screen/profile_page_screen.dart';
import 'package:flutter/material.dart';

class MainPageScreen extends StatefulWidget {
  const MainPageScreen({super.key});

  @override
  State<MainPageScreen> createState() => _MainPageScreenState();
}

class _MainPageScreenState extends State<MainPageScreen> {
  int _page = 0;
  selectIndex(int index) {
    setState(() {
      _page = index;
    });
  }

  List pages = [
    const HomePageScreen(),
    const AddProduct(),
    const HomePageScreen(),
    const HomePageScreen(),
    const ProfilePageScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          onTap: selectIndex,
          currentIndex: _page,
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.alarm),
              label: 'alert',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.camera,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline),
              label: 'favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ]),
    );
  }
}
