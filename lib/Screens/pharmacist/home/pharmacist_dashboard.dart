import 'package:flutter/material.dart';
import 'components/EditAddOTCMedicineButton.dart';
import 'components/EditAddPrescriptionMedicineButton.dart';
import 'components/Order_history.dart'; // Import the prescription medicine button file

class PharmacistDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pharmacist Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                'Welcome, Pharmacist!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            EditAddOTCMedicineButton(), // Use the OTC medicine button widget here
            SizedBox(height: 10),
            EditAddPrescriptionMedicineButton(),
            SizedBox(height: 10),
            OrderHistoryButton(),// Use the prescription medicine button widget here
          ],
        ),
      ),
    );
  }
}

// Additional screens for editing/adding medicines:

class EditAddOTCMedicineScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit/Add OTC Medicine'),
      ),
      body: Center(
        child: Text('Edit/Add OTC Medicine Screen'),
      ),
    );
  }
}

class EditAddPrescriptionMedicineScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit/Add Prescription Medicine'),
      ),
      body: Center(
        child: Text('Edit/Add Prescription Medicine Screen'),
      ),
    );
  }
}
