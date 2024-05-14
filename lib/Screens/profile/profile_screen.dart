import 'package:flutter/material.dart';
import 'components/my_account/my_account_screen.dart';
import 'components/profile_menu.dart';
import 'components/profile_pic.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = "/profile";

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            SizedBox(height: 40), // Adjust this height if needed
            const ProfilePic(),
            const SizedBox(height: 20), // Adjust this height if needed
            ProfileMenu(
              text: "My Account",
              icon: "assets/icons/User Icon.svg",
              color: Color.fromARGB(255, 0, 136, 102),
              press: () {
                Navigator.pushNamed(context, MyAccountScreen.routeName);
              },
            ),
            ProfileMenu(
              text: "Notifications",
              icon: "assets/icons/Bell.svg",
              color: Color.fromARGB(255, 0, 136, 102),
              press: () {},
            ),
            ProfileMenu(
              text: "Settings",
              icon: "assets/icons/Settings.svg",
              color: Color.fromARGB(255, 0, 136, 102),
              press: () {},
            ),
            ProfileMenu(
              text: "Help Center",
              icon: "assets/icons/Question mark.svg",
              color: Color.fromARGB(255, 0, 136, 102),
              press: () {},
            ),
            ProfileMenu(
              text: "Log Out",
              icon: "assets/icons/Log out.svg",
              color: Color.fromARGB(255, 0, 136, 102),
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}
