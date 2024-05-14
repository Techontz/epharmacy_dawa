// secret_code_page.dart
import 'package:final_project/Screens/pharmacist/home/pharmacist_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:final_project/Screens/Widgets/BottomNavBar.dart';

import 'Pharmacist_Bottom_NavBar.dart'; // Import the pharmacist dashboard or desired screen

class SecretCodePage extends StatefulWidget {
  const SecretCodePage({Key? key}) : super(key: key);

  @override
  _SecretCodePageState createState() => _SecretCodePageState();
}

class _SecretCodePageState extends State<SecretCodePage> {
  TextEditingController codeController = TextEditingController();
  String secretCode = "1234"; // Secret code for pharmacists

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Enter Secret Code"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: codeController,
                decoration: InputDecoration(
                  labelText: "Enter Secret Code",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  String enteredCode = codeController.text.trim();
                  if (enteredCode == secretCode) {
                    // Navigate to pharmacist dashboard
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BottomNavBar1(), // Replace with pharmacist dashboard widget
                      ),
                    );
                  } else {
                    // Show error message for invalid code
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Invalid secret code. Please try again."),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                },
                child: Text("Submit",
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 136, 102),
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
