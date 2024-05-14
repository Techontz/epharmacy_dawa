// login.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:final_project/Screens/Widgets/BottomNavBar.dart';
import 'package:final_project/Screens/Login-Signup/login_signup.dart';
import 'package:final_project/Screens/Widgets/Auth_text_field.dart';
import 'package:final_project/Screens/Widgets/auth_social_login.dart';
import 'package:final_project/Screens/Login-Signup/OTP_verification.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../pharmacist/home/pharmacist_dashboard.dart';
import '../pharmacist/secret_code_page.dart';

class Login extends StatelessWidget {
  final TextEditingController textFieldController = TextEditingController();

  Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                const SizedBox(height: 40),
                Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.height * 0.1,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/dawa2.png"),
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      child: Text(
                        "Enter Your Mobile Number",
                        style: GoogleFonts.poppins(
                          fontSize: 19.sp,
                          color: Colors.black87,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      child: Text(
                        "An OTP will be sent for verification",
                        style: GoogleFonts.poppins(
                          fontSize: 16.sp,
                          color: Colors.grey[800],
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 25),
                TextField(
                  controller: textFieldController,
                  decoration: InputDecoration(
                    fillColor: Colors.white70,
                    filled: true,
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    hintText: "Your Contact Number",
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        "+255",
                        style: TextStyle(
                          color: Color.fromARGB(255, 3, 190, 150),
                          fontWeight: FontWeight.w500,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Container(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: ElevatedButton(
                    onPressed: () {
                      String inputNumber = textFieldController.text.trim();
                      String pharmacistNumber = "769190100"; // Pharmacist specific number

                      if (inputNumber == pharmacistNumber) {
                        // Navigate to pharmacist dashboard
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            child: SecretCodePage(),
                          ),
                        );
                      } else {
                        // Proceed with regular user login flow
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            child: OTPVerification(),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 3, 190, 150),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      "CONTINUE",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 18.sp,
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                const Divider(),
                const SizedBox(height: 10),
                auth_social_logins(
                  logo: "images/google.png",
                  text: "Sign in with Google",
                ),
                const SizedBox(height: 120),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "By continuing you agree to ",
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        color: Colors.black87,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.bottomToTop,
                            child: Login(),
                          ),
                        );
                      },
                      child: Text(
                        "Terms and Conditions",
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          color: const Color.fromARGB(255, 3, 190, 150),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "and ",
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        color: Colors.black87,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.bottomToTop,
                            child: Login(),
                          ),
                        );
                      },
                      child: Text(
                        "Privacy Policy",
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          color: const Color.fromARGB(255, 3, 190, 150),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Text(
                      " of ePharmacy",
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
