import 'package:flutter/material.dart';
import 'EditAddPrescriptionMedicineScreen.dart'; // Import the screen file

class EditAddPrescriptionMedicineButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Navigate to edit/add prescription medicine screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EditAddPrescriptionMedicineScreen()),
        );
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 16.0),
      ),
      child: Text('Edit/Add Prescription Medicine',
        style: TextStyle(
          color: Color.fromARGB(255, 0, 136, 102),
        ),
      ),
    );
  }
}
