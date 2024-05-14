import 'package:flutter/material.dart';
import 'OrderHistoryScreen.dart'; // Import the screen file

class OrderHistoryButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Navigate to edit/add prescription medicine screen
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => OrderHistoryScreen()),
        );
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 16.0),
      ),
      child: Text('Order History',
        style: TextStyle(
          color: Color.fromARGB(255, 0, 136, 102),
        ),
      ),
    );
  }
}
