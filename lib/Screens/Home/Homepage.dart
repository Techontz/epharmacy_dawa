import 'dart:io';

import 'package:final_project/Screens/Home/components/tropical_diseases.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart'; // Import url_launcher package
import 'components/otc_medicine_section.dart';
import 'components/upload_prescription_button.dart';
import '../Widgets/banner.dart';
import 'components/upper_card.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController _searchText = TextEditingController();
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UpperCard(searchText: _searchText), // Use the UpperCard widget
          const SizedBox(height: 10),
          // Banners
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(width: 10),
                Banner1(),
                Banner2(),
                Banner3(),
                SizedBox(width: 10),
              ],
            ),
          ),
          const SizedBox(height: 20),
          UploadPrescriptionButton(),
          const SizedBox(height: 10),
          TropicalDiseases(),
          const SizedBox(height: 20),
          // OTC Medicine Section
          OtcMedicineSection(),
          const SizedBox(height: 35),
          // Help Center Card
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: 150 ,
              width: 370, // Adjust the height as needed
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.15),
                      spreadRadius: 0,
                      blurRadius: 0,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Need Help?',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Contact our customer support for assistance.',
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      height: 40, // Adjust the height as needed
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 0, 136, 102),
                        // Background color for the button
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextButton(
                        onPressed: () {
                          _launchWhatsApp(); // Launch WhatsApp when button is pressed
                        },
                        child: Text(
                          'Contact Support',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.white, // Text color for the button
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 50,),
        ],
      ),
    );
  }

  // Define a method to launch WhatsApp
  void _launchWhatsApp() async {
    String phoneNumber = '+255769190100'; // Replace with your WhatsApp number
    String message = 'Hello! I need support from your app.'; // Customize your message

    // Check if the platform is Android
    if (Platform.isAndroid) {
      // Use the intent URL scheme for opening WhatsApp on Android
      String url = 'intent://send/$phoneNumber#Intent;scheme=smsto;package=com.whatsapp;action=android.intent.action.SENDTO;end';

      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    } else {
      // For other platforms, use the default https://wa.me/ URL scheme
      String url = 'https://wa.me/$phoneNumber?text=${Uri.encodeComponent(message)}';

      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
  }
}
