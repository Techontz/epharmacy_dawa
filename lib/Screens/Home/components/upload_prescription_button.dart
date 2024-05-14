import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Views/uploadPrescription.dart';

class UploadPrescriptionButton extends StatelessWidget {
  const UploadPrescriptionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => UploadPrescription(),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Card(
          color: Colors.white,
          elevation: 0, // Remove elevation shadow
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Colors.grey.shade200, width: 2), // Add border
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Order with prescription",
                      style: GoogleFonts.poppins(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(255, 0, 136, 102),
                      ),
                    ),
                    Text(
                      "We'll get back to you",
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 90,
                  height: 45,
                  child: Card(
                    elevation: 1,
                    color: Color.fromARGB(255, 0, 136, 102),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'Upload',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 15.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
