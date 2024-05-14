import 'package:flutter/material.dart';

class MalariaMeds {
  final int id;
  final String title, description, dosage;
  final List<String> images;
  final double rating, price;
  bool isFavourite, isPopular;
  int quantity;

  MalariaMeds({
    required this.id,
    required this.images,
    this.rating = 0.0,
    this.isFavourite = false,
    this.isPopular = false,
    required this.title,
    required this.price,
    required this.description,
    required this.dosage,
    this.quantity = 0,
  });


  // Static routeName property
  static const String routeName = '/malaria_meds';
}

// Our demo Products

List<MalariaMeds> demoMalariaMeds = [
  MalariaMeds(
    id: 1,
    images: [
      "assets/images/ps4_console_white_1.png",
      "assets/images/ps4_console_white_2.png",
      "assets/images/ps4_console_white_3.png",
      "assets/images/ps4_console_white_4.png",
    ],
    title: "Pana",
    dosage: "400mg",
    price: 600.00,
    description: "Panadol is a popular pain reliever that contains paracetamol. It is used to treat mild to moderate pain including headaches, muscle aches, menstrual cramps, and toothaches. Panadol can also be used to reduce fever.",
    // rating: 4.8,
    isFavourite: true,
    isPopular: true,
  ),
  MalariaMeds(
    id: 2,
    images: [
      "assets/images/Image Popular Product 2.png",
      "assets/images/Image Popular Product 2.png",
      "assets/images/Image Popular Product 2.png",
      "assets/images/Image Popular Product 2.png",
    ],
    title: "Parac",
    dosage: "500mg",
    price: 500.00,
    description: "Paracetamol, also known as acetaminophen, is a medication used to treat pain and fever. It is commonly used for mild to moderate pain relief and to reduce fever. Paracetamol is often recommended as a first-line treatment for various types of pain.",
    // rating: 4.1,
    isPopular: true,
  ),
  MalariaMeds(
    id: 3,
    images: [
      "assets/images/glap.png",
      "assets/images/glap.png",
      "assets/images/glap.png",
      "assets/images/glap.png",
    ],
    title: "Antihis",
    dosage: "500mg",
    price: 360.00,
    description: "Antihistamines are a class of medications that are commonly used to treat allergies and allergic reactions. They work by blocking the effects of histamine, a substance produced by the body in response to allergens. Antihistamines can help relieve symptoms such as sneezing, itching, and runny nose.",
    // rating: 4.1,
    isFavourite: true,
    isPopular: true,
  ),
  MalariaMeds(
    id: 4,
    images: [
      "assets/images/wireless headset.png",
      "assets/images/wireless headset.png",
      "assets/images/wireless headset.png",
      "assets/images/wireless headset.png",
    ],
    title: "Motri",
    dosage: "600mg",
    price: 200.00,
    description: "Motrin is a nonsteroidal anti-inflammatory drug (NSAID) that is used to relieve pain, reduce inflammation, and lower fever. It is commonly used to treat conditions such as headache, muscle aches, arthritis, menstrual cramps, and minor injuries. Motrin works by blocking the production of certain chemicals in the body that cause pain and inflammation.",
    // rating: 4.1,
    isFavourite: true,
  ),
];
