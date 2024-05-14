import 'package:flutter/material.dart';
import 'EditAddOTCMedicineScreen.dart'; // Import the screen file

class EditAddOTCMedicineButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Navigate to edit/add OTC medicine screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EditAddOTCMedicineScreen()),
        );
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 16.0),
      ),
      child: Text('Edit/Add OTC Medicine',
        style: TextStyle(
          color: Color.fromARGB(255, 0, 136, 102),
        ),
      ),
    );
  }
}
