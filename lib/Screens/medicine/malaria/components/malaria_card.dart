import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../constants.dart';
import '../../../../models/Malaria_meds.dart';

class MalariaCard extends StatefulWidget {
  const MalariaCard({
    Key? key,
    this.width = 140,
    this.aspectRatio = 1.02,
    required this.malariaMeds,
    required this.onPress,
  }) : super(key: key);

  final double width, aspectRatio;
  final MalariaMeds malariaMeds;
  final VoidCallback onPress;

  @override
  _MalariaCardState createState() => _MalariaCardState();
}

class _MalariaCardState extends State<MalariaCard> {
  bool isFavorite = false;

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
                    child: Image.asset(widget.malariaMeds.images[0]),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              '${widget.malariaMeds.title}\n${widget.malariaMeds.dosage}',
              style: Theme.of(context).textTheme.bodyMedium,
              maxLines: 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\Tsh ${widget.malariaMeds.price}",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: kPrimaryColor,
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    height: 24,
                    width: 24,
                    decoration: BoxDecoration(
                      color: isFavorite
                          ? kPrimaryColor.withOpacity(0.15)
                          : kSecondaryColor.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      "assets/icons/Heart Icon_2.svg",
                      color: isFavorite
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
