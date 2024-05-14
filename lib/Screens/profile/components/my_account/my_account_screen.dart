import 'package:final_project/Screens/Login-Signup/Profile_screen.dart';
import 'package:final_project/Screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import '../../../Widgets/BottomNavBar.dart';
import '../../../otc/components/icon_btn_with_counter.dart';
import 'components/EditMyAccountScreen.dart';

class MyAccountScreen extends StatelessWidget {
  static const String routeName = "/my_account";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Profile"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Profile Information',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 136, 102),
                        ),
                      ),
                      SizedBox(height: 12),
                      buildInfoTile(Icons.person, 'Name', 'Condrat Rafiki'),
                      buildInfoTile(Icons.email, 'Email', 'condratrafiki@yahoo.com'),
                      buildInfoTile(Icons.phone, 'Phone', '+255 616-436-925'),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditMyAccountScreen(
                                defaultName: 'Condrat Rafiki', // Default Name
                                defaultEmail: 'condratrafiki@yahoo.com', // Default Email
                                defaultPhone: '+255 616-436-925', // Default Phone
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Color.fromARGB(255, 0, 136, 102),
                          padding: EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text('Edit Profile'),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'More Information',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 136, 102),
                        ),
                      ),
                      // SizedBox(height: 12),
                      // buildInfoTile(Icons.work, 'Position', 'Pharmacist'),
                      // buildInfoTile(Icons.location_on, 'Location', 'Muhimbili, Dar es salaam'),
                      // buildInfoTile(Icons.calendar_today, 'Experience', '5 years'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInfoTile(IconData icon, String title, String value) {
    return ListTile(
      leading: Icon(icon),
      title: Text('$title: $value'),
    );
  }
}
