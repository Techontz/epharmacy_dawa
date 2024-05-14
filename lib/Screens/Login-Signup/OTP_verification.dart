// otp_verification.dart
import 'package:final_project/Screens/Login-Signup/login.dart';
import 'package:final_project/Screens/Login-Signup/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:final_project/Screens/Widgets/BottomNavBar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../Widgets/Auth_text_field.dart';

class OTPVerification extends StatelessWidget {
  const OTPVerification({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: SizedBox(
            height: MediaQuery.of(context).size.height * 0.06,
            width: MediaQuery.of(context).size.width * 0.06,
            child: Image.asset("lib/icons/back2.png"),
          ),
          onPressed: () {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.leftToRight,
                child: Login(),
              ),
            );
          },
        ),
        centerTitle: true,
        title: Text(
          "OTP Verification",
          style: GoogleFonts.inter(
            color: Colors.black87,
            fontSize: 22.sp,
            fontWeight: FontWeight.w700,
            letterSpacing: 0,
          ),
        ),
        toolbarHeight: 110,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: Text(
                      "Enter the OTP sent to your mobile",
                      style: GoogleFonts.poppins(
                        fontSize: 18.sp,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              TextField(
                decoration: InputDecoration(
                  fillColor: Colors.white70,
                  filled: true,
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  hintText: "Enter OTP",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 45,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: Row(
                      children: [
                        Icon(
                          CupertinoIcons.arrow_clockwise,
                          size: 18.0, // Adjust the size as needed
                          color: Colors.grey[900],
                        ),
                        SizedBox(width: 4.0), // Adjust spacing between icon and text
                        Text(
                          "Resend",
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.grey[800],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      // Add your onTap functionality here
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.07,
                width: MediaQuery.of(context).size.width * 0.9,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        child: const register(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 3, 190, 150),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "VERIFY OTP",
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
            ],
          ),
        ),
      ),
    );
  }
}
