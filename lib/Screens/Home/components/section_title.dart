import 'package:flutter/material.dart';
import '../../otc/components/products_screen.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        TextButton(
          onPressed: () {
            // Navigate to OTCScreen when the button is pressed
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OTCScreen()),
            );
          },
          style: TextButton.styleFrom(foregroundColor: Colors.grey),
          child: const Text("See more"),
        ),
      ],
    );
  }
}
