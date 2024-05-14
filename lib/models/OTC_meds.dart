import 'package:flutter/material.dart';

class Product {
  final int id;
  final String title, description, dosage;
  final List<String> images;
  final double rating, price;
  bool isFavourite, isPopular;
  int quantity;

  Product({
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
}
// Our demo Products

List<Product> demoProduct = [
  Product(
    id: 1,
    images: [
      "assets/images/panadol1.png",
      "assets/images/panadol2.png",
      "assets/images/panadol3.png",
      "assets/images/panadol4.png",
    ],
    title: "Panadol",
    dosage: "400mg",
    price: 600.00,
    description: "Panadol is a popular pain reliever that contains paracetamol. It is used to treat mild to moderate pain including headaches, muscle aches, menstrual cramps, and toothaches. Panadol can also be used to reduce fever.",
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 2,
    images: [
      "assets/images/para1.png",
      "assets/images/para2.png",
      "assets/images/para3.png",
      "assets/images/para4.png",
    ],
    title: "Paracetamol",
    dosage: "500mg",
    price: 500.00,
    description: "Paracetamol, also known as acetaminophen, is a medication used to treat pain and fever. It is commonly used for mild to moderate pain relief and to reduce fever. Paracetamol is often recommended as a first-line treatment for various types of pain.",
    isPopular: true,
  ),
  Product(
    id: 3,
    images: [
      "assets/images/anti1.png",
      "assets/images/anti2.png",
      "assets/images/anti3.png",
      "assets/images/anti4.png",
    ],
    title: "Antihistamines",
    dosage: "500mg",
    price: 360.00,
    description: "Antihistamines are a class of medications that are commonly used to treat allergies and allergic reactions. They work by blocking the effects of histamine, a substance produced by the body in response to allergens. Antihistamines can help relieve symptoms such as sneezing, itching, and runny nose.",
    isFavourite: true,
    isPopular: true,
  ),
  Product(
    id: 4,
    images: [
      "assets/images/motrin1.png",
      "assets/images/motrin2.png",
      "assets/images/motrin3.png",
      "assets/images/motrin4.png",
    ],
    title: "Motrin",
    dosage: "600mg",
    price: 200.00,
    description: "Motrin is a nonsteroidal anti-inflammatory drug (NSAID) that is used to relieve pain, reduce inflammation, and lower fever. It is commonly used to treat conditions such as headache, muscle aches, arthritis, menstrual cramps, and minor injuries. Motrin works by blocking the production of certain chemicals in the body that cause pain and inflammation.",
    isFavourite: true,
  ),
];
