// proceed_to_checkout.dart

import 'package:flutter/material.dart';

class ProceedToCheckoutCard extends StatelessWidget {
  final VoidCallback onTap;

  const ProceedToCheckoutCard({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Color.fromARGB(255, 0, 136, 102),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 80),
          child: Text(
            'Proceed To Checkout',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
