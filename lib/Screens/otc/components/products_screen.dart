import 'package:flutter/material.dart';
import '../../../models/OTC_meds.dart';
import '../../cart/components/CartProvider.dart'; // Import your CartProvider
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badge;
import '../OTC_details_screen.dart';
import 'product_card.dart';

class OTCScreen extends StatelessWidget {
  static const String routeName = '/otc_screen';

  const OTCScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int cartCount = Provider.of<CartProvider>(context).cartItems.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text("OTC Medicine"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GridView.builder(
            itemCount: demoProduct.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 0.7,
              mainAxisSpacing: 20,
              crossAxisSpacing: 16,
            ),
            itemBuilder: (context, index) => ProductCard(
              product: demoProduct[index],
              onPress: () => Navigator.pushNamed(
                context,
                OTCDetailsScreen.routeName,
                arguments: ProductDetailsArguments(product: demoProduct[index]),
              ),
              updateCartCount: (quantity) {
                Provider.of<CartProvider>(context, listen: false).addToCart(demoProduct[index], quantity);
              },
              addToFavorites: (product) {
                // Implement addToFavorites logic
              },
              isFavorite: false, // Set the default value for isFavorite
            ),
          ),
        ),
      ),
      floatingActionButton: badge.Badge(
        badgeContent: Text(
          cartCount.toString(),
          style: TextStyle(color: Colors.white),
        ),
        position: badge.BadgePosition.topEnd(top: 0, end: 0),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/cart');
          },
          child: Icon(Icons.shopping_cart),
        ),
      ),
    );
  }
}
