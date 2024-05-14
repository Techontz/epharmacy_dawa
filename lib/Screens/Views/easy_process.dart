import 'package:flutter/material.dart';

class EasyProcess extends StatelessWidget {
  const EasyProcess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"icon": "lib/icons/appoint.png", "text": "Upload valid\nPrescription"},
      {"icon": "lib/icons/call.png", "text": "Receive\nconfirmation call"},
      {"icon": "lib/icons/Ambulance.png", "text": "Get medicines\nat your doorstep"},
    ];
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(
          categories.length * 2 - 1, // Adjusted length to add arrows
              (index) {
            if (index.isEven) {
              return CategoryCard(
                icon: categories[index ~/ 2]["icon"],
                text: categories[index ~/ 2]["text"],
                press: () {},
              );
            } else {
              return Padding(
                padding: const EdgeInsets.only(bottom: 40), // Adjust the bottom padding as needed
                child: Icon(
                  Icons.arrow_forward,
                  color: Color.fromARGB(255, 0, 136, 102), // Customize the color as needed
                  size: 24, // Customize the size as needed
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            height: 56,
            width: 56,
            decoration: BoxDecoration(
              color: Colors.indigo.shade50,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(icon), // Use Image.asset for PNGs
          ),
          const SizedBox(height: 4),
          Text(text, textAlign: TextAlign.center)
        ],
      ),
    );
  }
}
