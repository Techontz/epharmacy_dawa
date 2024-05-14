import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:final_project/Screens/Login-Signup/login.dart';
import 'package:final_project/Screens/Login-Signup/register.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginSignup extends StatelessWidget {
  const LoginSignup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const SizedBox(
          height: 200,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.15,
          width: MediaQuery.of(context).size.height * 01,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/dawa2.png"),
                  filterQuality: FilterQuality.high)),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Lets get Started!",
              style: GoogleFonts.poppins(
                  fontSize: 22.sp,
                  color: Color.fromARGB(211, 14, 13, 13),
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                "Continue to enjoy the features we've \nprovided, and stay healthy",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    fontSize: 15.sp,
                    color: Color.fromARGB(211, 14, 13, 13),
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 80,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.06,
          width: MediaQuery.of(context).size.width * 0.7,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  PageTransition(
                      type: PageTransitionType.rightToLeft, child: Login()));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 3, 190, 150),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
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
      ]),
    );
  }
}
