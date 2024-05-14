import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../models/Malaria_meds.dart';


class MalariaMedsDescription extends StatefulWidget {
  const MalariaMedsDescription({
    Key? key,
    required this.malariaMeds,
    this.pressOnSeeMore,
  }) : super(key: key);

  final MalariaMeds malariaMeds;
  final GestureTapCallback? pressOnSeeMore;

  @override
  _MalariaMedsDescriptionState createState() => _MalariaMedsDescriptionState();
}

class _MalariaMedsDescriptionState extends State<MalariaMedsDescription> {
  void _toggleFavorite() {
    setState(() {
      widget.malariaMeds.isFavourite = !widget.malariaMeds.isFavourite;
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
                    widget.malariaMeds.title,
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
                widget.malariaMeds.description,
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
                    'Dosage: ${widget.malariaMeds.dosage}', // Display dosage
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Price: \Tsh ${widget.malariaMeds.price.toStringAsFixed(2)}', // Display price from product
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
                color: widget.malariaMeds.isFavourite
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
                  widget.malariaMeds.isFavourite
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
