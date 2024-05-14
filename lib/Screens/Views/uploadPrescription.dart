// upload_prescription.dart

import 'dart:io';
import 'package:final_project/Screens/Views/proceed_to_checkout.dart';
import 'package:final_project/Screens/cart/components/check_out_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../Widgets/BottomNavBar.dart';
import '../Home/Homepage.dart';
import '../cart/cart_screen.dart';
import '../otc/components/icon_btn_with_counter.dart';
import 'orders.dart';
import 'prescription_details.dart'; // Import the new file

class UploadPrescription extends StatefulWidget {
  const UploadPrescription({Key? key}) : super(key: key);

  @override
  _UploadPrescriptionState createState() => _UploadPrescriptionState();
}

class _UploadPrescriptionState extends State<UploadPrescription> {
  List<File> _prescriptions = [];
  List<bool> _selected = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Container(
            height: MediaQuery.of(context).size.height * 0.06,
            width: MediaQuery.of(context).size.width * 0.06,
            child: Image.asset("lib/icons/back2.png"),
          ),
          onPressed: () {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.leftToRight,
                child: BottomNavBar(),
              ),
            );
          },
        ),
        title: Text(
          "Upload Prescription",
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconBtnWithCounter(
                  svgSrc: "assets/icons/Cart Icon.svg",
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CartScreen()),
                    );
                  },
                ),
                SizedBox(width: 15),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 27), // Adjust spacing as needed
          GestureDetector(
            onTap: () async {
              final XFile? image = await ImagePicker().pickImage(
                source: ImageSource.camera,
              );

              // Handle the picked image as needed
              if (image != null) {
                setState(() {
                  _prescriptions.add(File(image.path));
                  _selected.add(false);
                  // Show pop-up message on successful image addition
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Prescription Added'),
                      content: Text(
                        'When you allow, the prescription will automatically be sent to the pharmacist for confirmation and order will be processed.',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('OK'),
                        ),
                      ],
                    ),
                  );
                });
              }
            },
            child: buildOptionCard(
              icon: "images/camera.png",
              label: "Camera",
            ),
          ),
          SizedBox(height: 10), // Adjust spacing as needed
          GestureDetector(
            onTap: () async {
              final XFile? image = await ImagePicker().pickImage(
                source: ImageSource.gallery,
              );

              // Handle the picked image as needed
              if (image != null) {
                setState(() {
                  _prescriptions.add(File(image.path));
                  _selected.add(false);
                });
              }
            },
            child: buildOptionCard(
              icon: "images/gallery.png",
              label: "From Gallery",
            ),
          ),

          SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              // Show the details about valid prescription
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (BuildContext context) {
                  return PrescriptionDetails();
                },
              );
            },
            child: Text(
              'What is a valid prescription?',
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: _prescriptions.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: Image.file(_prescriptions[index]),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Close'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 25),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      leading: Image.file(_prescriptions[index]),
                      title: Text('Prescription ${index + 1},  (Tap to View)'),
                      trailing: GestureDetector(
                        onTap: () {
                          setState(() {
                            _prescriptions.removeAt(index);
                            _selected.removeAt(index);
                          });
                        },
                        child: Icon(
                          CupertinoIcons.clear_circled,
                          size: 30,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Divider(), // Divider added
          ProceedToCheckoutCard(
            onTap: () {
              // Navigate to checkout page
            },
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget buildOptionCard({required String icon, required String label}) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: 380,
        height: 65,
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Row(
              children: [
                ImageIcon(
                  AssetImage(icon),
                  size: 24,
                  color: Color.fromARGB(255, 0, 136, 102),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Text(
                    label,
                    style: TextStyle(
                      fontSize: 17,
                      color: Color.fromARGB(255, 0, 136, 102),
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
