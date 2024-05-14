import 'package:final_project/Screens/Home/Homepage.dart';
import 'package:final_project/Screens/otc/components/products_screen.dart';
import 'package:final_project/Screens/profile/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'cart/cart_screen.dart';
import 'medicine/malariaMeds_details_Screen.dart';
import 'otc/OTC_details_screen.dart';

final Map<String, WidgetBuilder> routes = {
  // InitScreen.routeName: (context) => const InitScreen(),
  // SplashScreen.routeName: (context) => const SplashScreen(),
  // SignInScreen.routeName: (context) => const SignInScreen(),
  // ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen(),
  // LoginSuccessScreen.routeName: (context) => const LoginSuccessScreen(),
  // SignUpScreen.routeName: (context) => const SignUpScreen(),
  // CompleteProfileScreen.routeName: (context) => const CompleteProfileScreen(),
  // OtpScreen.routeName: (context) => const OtpScreen(),
  // Homepage.routeName: (context) => const Homepage(),
  OTCScreen.routeName: (context) => const OTCScreen(),
  OTCDetailsScreen.routeName: (context) => const OTCDetailsScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  // ProfileScreen.routeName: (context) => ProfileScreen(),
  // MalariaMedsDetailsScreen.routeName: (context) => MalariaMedsDetailsScreen(),
};