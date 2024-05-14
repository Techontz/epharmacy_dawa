import 'package:flutter/material.dart';

class ValidPrescription extends StatelessWidget {
  const ValidPrescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categories = [
      {"icon": "lib/icons/Doctor.png", "text": "Doctor\nDetails"},
      {"icon": "lib/icons/callender.png", "text": "Date of\nPrescription"},
      {"icon": "lib/icons/appoint.png", "text": "Patient\nDetails"},
      {"icon": "lib/icons/injection.png", "text": "Dosage\nDetails"},
    ];
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          categories.length,
              (index) => CategoryCard(
            icon: categories[index]["icon"],
            text: categories[index]["text"],
            press: () {},
          ),
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
