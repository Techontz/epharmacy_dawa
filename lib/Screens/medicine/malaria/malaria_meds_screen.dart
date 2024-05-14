import 'package:flutter/material.dart';
import '../../../models/Malaria_meds.dart';
import '../malariaMeds_details_Screen.dart';
import 'components/malaria_card.dart';

class MalariaMedsScreen extends StatefulWidget {
  const MalariaMedsScreen({Key? key}) : super(key: key);

  static String routeName = "/medicine";

  @override
  _MalariaMedsScreenState createState() => _MalariaMedsScreenState();
}

class _MalariaMedsScreenState extends State<MalariaMedsScreen> {
  int cartCount = 0; // Initialize cart count

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Malaria Medicines"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GridView.builder(
            itemCount: demoMalariaMeds.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 0.7,
              mainAxisSpacing: 20,
              crossAxisSpacing: 16,
            ),
            itemBuilder: (context, index) => MalariaCard(
              malariaMeds: demoMalariaMeds[index],
              onPress: () => Navigator.pushNamed(
                context,
                MalariaMedsDetailsScreen.routeName,
                arguments: MalariaMedsDetailsArguments(malariaMeds: demoMalariaMeds[index]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
