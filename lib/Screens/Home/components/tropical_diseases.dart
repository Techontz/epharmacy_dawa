import 'package:flutter/material.dart';
import '../../medicine/cholera/cholera_meds_screen.dart';
import '../../medicine/dengue/dengue_meds_screen.dart';
import '../../medicine/malaria/malaria_meds_screen.dart';
import '../../otc/components/products_screen.dart';
import '../../medicine/malaria/components/tropical_diseases_screen.dart';

class TropicalDiseases extends StatelessWidget {
  const TropicalDiseases({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Tropical Diseases",
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
                    MaterialPageRoute(builder: (context) => TropicalDiseasesScreen()),
                  );
                },
                style: TextButton.styleFrom(foregroundColor: Colors.grey),
                child: const Text("See more"),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              TropicalDiseasesCard(
                image: "assets/images/Malaria.jpg",
                category: "Malaria",
                numOfMeds: 18,
                press: () {
                  Navigator.pushNamed(
                    context,
                    MalariaMedsScreen.routeName,
                  );
                },
              ),
              TropicalDiseasesCard(
                image: "assets/images/cholera.jpg",
                category: "Cholera",
                numOfMeds: 24,
                press: () {
                  Navigator.pushNamed(
                    context,
                    CholeraMedsScreen.routeName,
                  );
                },
              ),
              TropicalDiseasesCard(
                image: "assets/images/dengue.jpg",
                category: "Dengue",
                numOfMeds: 18,
                press: () {
                  Navigator.pushNamed(
                    context,
                    DengueMedsScreen.routeName,
                  );
                },
              ),
              const SizedBox(width: 20),
            ],
          ),
        ),
      ],
    );
  }
}

class TropicalDiseasesCard extends StatelessWidget {
  const TropicalDiseasesCard({
    Key? key,
    required this.category,
    required this.image,
    required this.numOfMeds,
    required this.press,
  }) : super(key: key);

  final String category, image;
  final int numOfMeds;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: 242,
          height: 100,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black54,
                        Colors.black38,
                        Colors.black26,
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  child: Text.rich(
                    TextSpan(
                      style: const TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                          text: "$category\n",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: "$numOfMeds Medicines")
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
