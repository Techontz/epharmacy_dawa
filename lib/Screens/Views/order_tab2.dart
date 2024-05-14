import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OrderTab2 extends StatelessWidget {
  const OrderTab2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(
          child: Text(
            "Nothing to show",
            style: GoogleFonts.poppins(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: Colors.grey),
          ),
        )
      ]),
    );
  }
}
