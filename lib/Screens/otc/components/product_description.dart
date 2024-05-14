import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../constants.dart';
import '../../../models/OTC_meds.dart';
import '../../Views/prescription_details.dart';

class ProductDescription extends StatefulWidget {
  const ProductDescription({
    Key? key,
    required this.product,
    this.pressOnSeeMore,
  }) : super(key: key);

  final Product product;
  final GestureTapCallback? pressOnSeeMore;

  @override
  _ProductDescriptionState createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  void _toggleFavorite() {
    setState(() {
      widget.product.isFavourite = !widget.product.isFavourite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    widget.product.title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 64,
              ),
              child: Text(
                widget.product.description,
                maxLines: 3,
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Dosage: ${widget.product.dosage}', // Display dosage
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Price: \Tsh ${widget.product.price.toStringAsFixed(2)}', // Display price from product
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.orange[800],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 50,
          right: 0,
          child: GestureDetector(
            onTap: _toggleFavorite,
            child: Container(
              padding: const EdgeInsets.all(16),
              width: 48,
              decoration: BoxDecoration(
                color: widget.product.isFavourite
                    ? const Color(0xFFFFE6E6)
                    : const Color(0xFFF5F6F9),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
              child: SvgPicture.asset(
                "assets/icons/Heart Icon_2.svg",
                colorFilter: ColorFilter.mode(
                  widget.product.isFavourite
                      ? const Color(0xFFFF4848)
                      : const Color(0xFFDBDEE4),
                  BlendMode.srcIn,
                ),
                height: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
