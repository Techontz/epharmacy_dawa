import 'package:flutter/material.dart';
import '../../cholera/cholera_meds_screen.dart';
import '../../dengue/dengue_meds_screen.dart';
import '../malaria_meds_screen.dart';
import '../../../otc/components/products_screen.dart';

class TropicalDiseasesScreen extends StatelessWidget {
  // Sample data for images, their names, and medicine count
  final List<Map<String, dynamic>> imageData = [
    {
      'name': 'Malaria',
      'image': 'assets/images/Malaria.jpg',
      'medicines': 5,
      'onPressed': (BuildContext context) {
        // Navigate to OTCScreen when the button is pressed
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MalariaMedsScreen()),
        );
      },
    },
    {
      'name': 'Cholera',
      'image': 'assets/images/cholera.jpg',
      'medicines': 7,
      'onPressed': (BuildContext context) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CholeraMedsScreen()),
        );
      },
    },
    {
      'name': 'Dengue',
      'image': 'assets/images/dengue.jpg',
      'medicines': 3,
      'onPressed': (BuildContext context) {
        // Navigate to OTCScreen when the button is pressed
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DengueMedsScreen()),
        );
      },
    },
    // Add more data as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tropical Diseases"),
      ),
      body: ListView.builder(
        itemCount: imageData.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              imageData[index]['onPressed'](context); // Pass context here
            },
            child: Card(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(imageData[index]['image']),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          imageData[index]['name'],
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Medicines: ${imageData[index]['medicines']}',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
