import 'package:ecommerce_app/screens/cart_screen.dart';
import 'package:ecommerce_app/screens/favourite_screen.dart';
import 'package:ecommerce_app/screens/home_screen.dart';
import 'package:ecommerce_app/screens/menu_screen.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int screenIndex = 0;
  List screenList = [
    const HomeScreen(),
    const MenuScreen(),
    const CartScreen(),
    const FavouriteScreen(),
    const Text("Fifth Screen"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white70,
          showUnselectedLabels: false,
          onTap: (value) {
            setState(() {
              screenIndex = value;
            });
          },
          currentIndex: screenIndex,
          backgroundColor: const Color(0xffB9202B),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
              backgroundColor: Color(0xffB9202B),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.menu),
                label: "Menu",
                backgroundColor: Color(0xffB9202B)),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_checkout),
                label: "Shopping",
                backgroundColor: Color(0xffB9202B)),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_rounded),
                label: "Favourite",
                backgroundColor: Color(0xffB9202B)),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Profile",
                backgroundColor: Color(0xffB9202B)),
          ]),
      body: screenList[screenIndex],
    );
  }
}
