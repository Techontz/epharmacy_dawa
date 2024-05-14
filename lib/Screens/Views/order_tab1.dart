import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:final_project/Screens/Views/order_card.dart'; // Import the OrderCard widget
import 'package:responsive_sizer/responsive_sizer.dart';

class OrderTab1 extends StatelessWidget {
  const OrderTab1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          OrderCard(
            confirmation: "Pending",
            mainText: "Prescription 1",
            orderNo: "ID8239",
            date: "10/04/2024",
            time: "10:30 AM",
            image: "images/pharmacist3.png",
          ),
          SizedBox(
            height: 20,
          ),
          OrderCard(
            confirmation: "Confirmed",
            mainText: "Prescription 2",
            orderNo: "ID4367",
            date: "26/03/2024",
            time: "2:00 PM",
            image: "images/pharmacist3.png",
          ),
        ],
      ),
    );
  }
}

