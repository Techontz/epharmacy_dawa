import 'package:final_project/Screens/Views/orders.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Home/Homepage.dart';
import '../Views/chatPage.dart';
import '../favorite/favorite_screen.dart';
import '../profile/profile_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int index = 0;
  final screens = [
    Homepage(),
    MyOrders(),
    FavoriteScreen(),
    ChatPage(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: Colors.teal[100],
          labelTextStyle: MaterialStateProperty.all(
            TextStyle(fontSize:14, fontWeight: FontWeight.w500, color: Colors.black),
          ),
        ),
        child: NavigationBar(
          height: 60,
          backgroundColor: Colors.white,
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          selectedIndex: index,
          animationDuration: Duration(seconds: 2),
          onDestinationSelected: (index) =>
              setState(() => this.index = index),
          destinations: const [
            NavigationDestination(
              icon: Icon(CupertinoIcons.house),
              selectedIcon: Icon(CupertinoIcons.house_fill),// Changed to Icons.home from CupertinoIcons.house
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(CupertinoIcons.bag),
              selectedIcon: Icon(CupertinoIcons.bag_fill),// Changed to Icons.shopping_cart from CupertinoIcons.cart
              label: 'Orders',
            ),
            NavigationDestination(
              icon: Icon(CupertinoIcons.heart),
              selectedIcon: Icon(CupertinoIcons.heart_fill),// Changed to Icons.shopping_cart from CupertinoIcons.cart
              label: 'Wishlist',
            ),
            NavigationDestination(
              icon: Icon(CupertinoIcons.captions_bubble),
              selectedIcon: Icon(CupertinoIcons.captions_bubble_fill),// Changed to Icons.shopping_cart from CupertinoIcons.cart
              label: 'Chat',
            ),
            NavigationDestination(
              icon: Icon(CupertinoIcons.person),
              selectedIcon: Icon(CupertinoIcons.person_fill),// Changed to Icons.shopping_cart from CupertinoIcons.cart
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
