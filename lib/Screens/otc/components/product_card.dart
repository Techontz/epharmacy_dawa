import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../constants.dart';
import '../../../models/OTC_meds.dart';
import 'package:badges/badges.dart' as badge; // Import with prefix

class ProductCard extends StatefulWidget {
  const ProductCard({
    Key? key,
    this.width = 140,
    this.aspectRatio = 1.02,
    required this.product,
    required this.onPress,
    required this.updateCartCount,
    required this.addToFavorites,
    required this.isFavorite, // Define isFavorite parameter
  }) : super(key: key);

  final double width, aspectRatio;
  final Product product;
  final VoidCallback onPress;
  final Function(int) updateCartCount;
  final Function(Product) addToFavorites;
  final bool isFavorite; // Add isFavorite parameter

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: GestureDetector(
        onTap: widget.onPress,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: widget.aspectRatio,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: kSecondaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Image.asset(widget.product.images[0]),
                  ),
                ),
                Positioned(
                  bottom: 5,
                  right: 5,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {
                      widget.updateCartCount(1);
                    },
                    child: Center(
                      child: Icon(
                        CupertinoIcons.add_circled_solid,
                        color: kPrimaryColor,
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              '${widget.product.title}\n${widget.product.dosage}',
              style: Theme.of(context).textTheme.bodyMedium,
              maxLines: 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Tsh ${widget.product.price}",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: kPrimaryColor,
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {
                    // Add the product to favorites and the cart
                    widget.addToFavorites(widget.product);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    height: 24,
                    width: 24,
                    decoration: BoxDecoration(
                      color: widget.isFavorite
                          ? kPrimaryColor.withOpacity(0.15)
                          : kSecondaryColor.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      "assets/icons/Heart Icon_2.svg",
                      color: widget.isFavorite
                          ? const Color(0xFFFF4848)
                          : const Color(0xFFDBDEE4),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
