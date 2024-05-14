import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../models/OTC_meds.dart';
import '../cart/components/CartProvider.dart';
import '../otc/OTC_details_screen.dart';
import '../otc/components/product_card.dart';
import 'FavoriteProvider.dart';
import 'package:badges/badges.dart' as badges;

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  int cartCount = 0;
  List<Product> favoriteProducts = [];

  @override
  void initState() {
    super.initState();
    favoriteProducts = Provider.of<FavoritesProvider>(context, listen: false).getFavorites();
    Provider.of<CartProvider>(context, listen: false).addListener(updateCartCount);
    updateCartCount();
  }

  void updateCartCount() {
    setState(() {
      cartCount = Provider.of<CartProvider>(context, listen: false).cartItems.length;
    });
  }

  @override
  void dispose() {
    Provider.of<CartProvider>(context, listen: false).removeListener(updateCartCount);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Favorites",
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        elevation: 5,
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.indigo.withOpacity(0.3),
                Colors.white.withOpacity(0.3),
                Colors.indigo.withOpacity(0.3),
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.70,
          ),
          itemCount: favoriteProducts.length,
          itemBuilder: (context, index) {
            final product = favoriteProducts[index];
            final isFavorite = Provider.of<FavoritesProvider>(context).favoriteProducts.contains(product);
            return ProductCard(
              product: product,
              onPress: () {
                Navigator.pushNamed(
                  context,
                  OTCDetailsScreen.routeName,
                  arguments: ProductDetailsArguments(product: product),
                );
              },
              updateCartCount: (int newCartCount) {
                setState(() {
                  cartCount = newCartCount;
                });
              },
              addToFavorites: (Product product) {
                // Implement addToFavorites logic here
                Provider.of<FavoritesProvider>(context, listen: false).addToFavorites(product);
              },
              isFavorite: isFavorite,
            );
          },
        ),
      ),
      floatingActionButton: badges.Badge(
        badgeContent: Text(
          cartCount.toString(),
          style: TextStyle(color: Colors.white),
        ),
        position: badges.BadgePosition.topEnd(top: 0, end: 0),
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
