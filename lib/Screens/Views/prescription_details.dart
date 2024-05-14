import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'valid_prescription.dart';
import 'easy_process.dart';

class PrescriptionDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.85, // Adjust this value to change the height
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(10),
            topRight: const Radius.circular(10),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Valid Prescription Details',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Divider(),
            ValidPrescription(),
            SizedBox(height: 0), // Spacer between Categories and Do's and Don'ts
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'Do\'s and Don\'ts',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17.sp,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(),
                  ),
                ],
              ),
            ),
            SizedBox(height: 0), // Spacer between Do's and Don'ts and the description
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.check, color: Color.fromARGB(255, 0, 136, 102)), // Green tick icon
                  SizedBox(width: 15), // Spacer
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Upload Clear Image',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Ensure picture is taken with clear visible\nhandwriting/type. Place prescription on a\nflat surface to get better focus and clear\nimage.',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 0), // Spacer between Do's and Don'ts and the description
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.close, color: Colors.red), // Red close icon
                  SizedBox(width: 15), // Spacer
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'No Pictures of Medicines',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 0), // Spacer between Do's and Don'ts and the description
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.close, color: Colors.red), // Red close icon
                  SizedBox(width: 15), // Spacer
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Do Not Crop the Image',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            Divider(),
            SizedBox(height: 0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Easy Process',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            EasyProcess(),
          ],
        ),
      ),
    );
  }
}
