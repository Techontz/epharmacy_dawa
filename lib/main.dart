import 'package:final_project/Screens/medicine/malariaMeds_details_Screen.dart';
import 'package:final_project/Screens/profile/components/my_account/my_account_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:final_project/Screens/cart/cart_screen.dart';
import 'package:final_project/Screens/Home/Homepage.dart';
import 'package:final_project/Screens/Views/Screen1.dart';
import 'package:final_project/Screens/medicine/cholera/cholera_meds_screen.dart';
import 'package:final_project/Screens/medicine/dengue/dengue_meds_screen.dart';
import 'package:final_project/Screens/medicine/malaria/malaria_meds_screen.dart';
import 'package:final_project/Screens/profile/profile_screen.dart';
import 'package:final_project/Screens/Login-Signup/login.dart';
import 'package:final_project/Screens/Login-Signup/login_signup.dart';
import 'Screens/cart/components/CartProvider.dart';
import 'Screens/cart/components/checkout_screen.dart';
import 'Screens/favorite/FavoriteProvider.dart';
import 'Screens/favorite/favorite_screen.dart';
import 'Screens/otc/OTC_details_screen.dart';

void main() {
  runApp(const Medics());
}

class Medics extends StatelessWidget {
  const Medics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => FavoritesProvider()),// Initialize CartProvider here
        // ChangeNotifierProvider(create: (_) => UserManagementProvider()),
      ],
      child: ResponsiveSizer(builder: (context, orientation, screenType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/': (context) => Screen1(),
            '/medicine': (context) => MalariaMedsScreen(),
            '/medicine1': (context) => CholeraMedsScreen(),
            '/medicine2': (context) => DengueMedsScreen(),
            OTCDetailsScreen.routeName: (context) => OTCDetailsScreen(),
            CartScreen.routeName: (context) => CartScreen(),
            '/profile': (context) => ProfileScreen(),
            '/my_account': (context) => MyAccountScreen(),
            '/home': (context) => Homepage(),
            '/login': (context) => Login(),
            '/favorites': (context) => FavoriteScreen(),
            '/loginSignup': (context) => LoginSignup(),
            '/malaria_details': (context) => MalariaMedsDetailsScreen(),
            '/checkout': (context) => const CheckoutScreen(items: []),
          },
          themeMode: ThemeMode.system,
          theme: ThemeData(),
          darkTheme: ThemeData(),
        );
      }),
    );
  }
}
