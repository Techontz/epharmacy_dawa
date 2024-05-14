import 'package:final_project/Screens/pharmacist/home/pharmacist_dashboard.dart';
import 'package:final_project/Screens/pharmacist/prescription_verification/prescription_verification_screen.dart';
import 'package:final_project/Screens/pharmacist/profile_pharmacist/pharmacist_profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'chat/Pharmacist_chat_screen.dart';
import 'order_processing/order_processing_screen.dart';


class BottomNavBar1 extends StatefulWidget {
  const BottomNavBar1({Key? key}) : super(key: key);

  @override
  State<BottomNavBar1> createState() => _BottomNavBar1State();
}

class _BottomNavBar1State extends State<BottomNavBar1> {
  int index = 0;
  final screens = [
    PharmacistDashboard(),
    OrderProcessingScreen(),
    PrescriptionVerificationScreen(),
    Chats(),
    PharmacistProfileScreen(),
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
              label: 'Dashboard',
            ),
            NavigationDestination(
              icon: Icon(CupertinoIcons.bag),
              selectedIcon: Icon(CupertinoIcons.bag_fill),// Changed to Icons.shopping_cart from CupertinoIcons.cart
              label: 'Orders',
            ),
            NavigationDestination(
              icon: Icon(CupertinoIcons.heart),
              selectedIcon: Icon(CupertinoIcons.heart_fill),// Changed to Icons.shopping_cart from CupertinoIcons.cart
              label: 'Prescription',
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
