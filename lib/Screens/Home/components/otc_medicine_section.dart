import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../models/OTC_meds.dart';
import '../../cart/components/CartProvider.dart';
import '../../favorite/FavoriteProvider.dart';
import '../../otc/OTC_details_screen.dart';
import '../../otc/components/product_card.dart';
import 'section_title.dart';

class OtcMedicineSection extends StatelessWidget {
  const OtcMedicineSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SectionTitle(
            title: "OTC Medicine",
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                demoProduct.length, // Assuming demoProduct is your list of OTC meds
                    (index) {
                  final product = demoProduct[index];
                  if (product.isPopular) {
                    // Check if the product is in favorites
                    final isFavorite = Provider.of<FavoritesProvider>(context).favoriteProducts.contains(product);
                    return Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: ProductCard(
                        product: product,
                        onPress: () => Navigator.pushNamed(
                          context,
                          OTCDetailsScreen.routeName,
                          arguments: ProductDetailsArguments(product: product),
                        ),
                        updateCartCount: (quantity) {
                          Provider.of<CartProvider>(context, listen: false)
                              .addToCart(product, quantity);
                        },
                        addToFavorites: (product) {
                          // Add your logic to add the product to favorites
                          Provider.of<FavoritesProvider>(context, listen: false)
                              .addToFavorites(product);
                        },
                        isFavorite: isFavorite, // Pass isFavorite parameter
                      ),
                    );
                  }
                  return const SizedBox.shrink();
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
