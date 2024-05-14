import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:final_project/Screens/Widgets/BottomNavBar.dart';
import 'package:final_project/Screens/Widgets/Auth_text_field.dart';

class register extends StatelessWidget {
  const register({Key? key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Unfocus the current focus node when tapping outside of text input areas
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.height * 01,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("images/dawa2.png"),
                          filterQuality: FilterQuality.high)),
                ),

                SizedBox(
                  height: 0,
                ),

                Center(
                  child: GestureDetector(
                    child: Text(
                      "Please Complete\nRegistration",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 19.sp,
                        color: Colors.black87,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 20,
                ),

                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start, // Aligns children to the start (left) of the row
                    children: [
                      Text(
                        "NAME",
                        style: GoogleFonts.poppins(
                          fontSize: 16.sp,
                          color: Colors.black87,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                    height: 5
                ),

                Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: TextField(
                      decoration: InputDecoration(
                        fillColor: Colors.white70,
                        filled: true,
                        contentPadding:
                        EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        hintText: "",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start, // Aligns children to the start (left) of the row
                    children: [
                      Text(
                        "GENDER",
                        style: GoogleFonts.poppins(
                          fontSize: 16.sp,
                          color: Colors.black87,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                    height: 5
                ),

                Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        fillColor: Colors.white70,
                        filled: true,
                        contentPadding:
                        EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      value: 'Male', // Default value
                      onChanged: (String? newValue) {
                        // Handle the gender change
                      },
                      items: <String>['Male', 'Female']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start, // Aligns children to the start (left) of the row
                    children: [
                      Text(
                        "AGE",
                        style: GoogleFonts.poppins(
                          fontSize: 16.sp,
                          color: Colors.black87,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                    height: 5
                ),

                Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: TextField(
                      decoration: InputDecoration(
                        fillColor: Colors.white70,
                        filled: true,
                        contentPadding:
                        EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        hintText: "",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start, // Aligns children to the start (left) of the row
                    children: [
                      Text(
                        "ADDRESS",
                        style: GoogleFonts.poppins(
                          fontSize: 16.sp,
                          color: Colors.black87,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                    height: 5
                ),

                SizedBox(
                    height: 5
                ),

                Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: TextField(
                      decoration: InputDecoration(
                        fillColor: Colors.white70,
                        filled: true,
                        contentPadding:
                        EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        hintText: "",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 20,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          child: BottomNavBar(),
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
                      "Create account",
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
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
