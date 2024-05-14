import 'package:flutter/material.dart';
import '../../../models/Malaria_meds.dart';
import '../../../models/OTC_meds.dart';


class CholeraMedsScreen extends StatefulWidget {
  const CholeraMedsScreen({Key? key}) : super(key: key);

  static String routeName = "/medicine1";

  @override
  _CholeraMedsScreenState createState() => _CholeraMedsScreenState();
}

class _CholeraMedsScreenState extends State<CholeraMedsScreen> {
  int cartCount = 0; // Initialize cart count

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cholera Medicines"),
      ),
      // body: SafeArea(
      //   child: Padding(
      //     padding: const EdgeInsets.symmetric(horizontal: 16),
      //     child: GridView.builder(
      //       itemCount: demoMalariaMeds.length,
      //       gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
      //         maxCrossAxisExtent: 200,
      //         childAspectRatio: 0.7,
      //         mainAxisSpacing: 20,
      //         crossAxisSpacing: 16,
      //       ),
      //       itemBuilder: (context, index) => MalariaCard(
      //         MalariaMeds: demoMalariaMeds[index],
      //         onPress: () => Navigator.pushNamed(
      //           context,
      //           OTCDetailsScreen.routeName,
      //           arguments: ProductDetailsArguments(product: demoMalariaMeds[index]),
      //         ),
      //         updateCartCount: (quantity) {
      //           setState(() {
      //             cartCount += quantity; // Update cart count by the specified quantity
      //           });
      //         },
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
