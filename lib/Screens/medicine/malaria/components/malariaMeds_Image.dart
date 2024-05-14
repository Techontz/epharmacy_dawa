import 'package:flutter/material.dart';
import '../../../../constants.dart';
import '../../../../models/Malaria_meds.dart';



class MalariaMedsImages extends StatefulWidget {
  const MalariaMedsImages({
    Key? key,
    required this.malariaMeds,
  }) : super(key: key);

  final MalariaMeds malariaMeds;

  @override
  _MalariaMedsImagesState createState() => _MalariaMedsImagesState();
}

class _MalariaMedsImagesState extends State<MalariaMedsImages> {
  int selectedImage = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 238,
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.asset(widget.malariaMeds.images[selectedImage]),
          ),
        ),
        // SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
              widget.malariaMeds.images.length,
                  (index) => SmallMalariaMedsImage(
                isSelected: index == selectedImage,
                press: () {
                  setState(() {
                    selectedImage = index;
                  });
                },
                image: widget.malariaMeds.images[index],
              ),
            ),
          ],
        )
      ],
    );
  }
}

class SmallMalariaMedsImage extends StatefulWidget {
  const SmallMalariaMedsImage(
      {super.key,
        required this.isSelected,
        required this.press,
        required this.image});

  final bool isSelected;
  final VoidCallback press;
  final String image;

  @override
  State<SmallMalariaMedsImage> createState() => _SmallMalariaMedsImageState();
}

class _SmallMalariaMedsImageState extends State<SmallMalariaMedsImage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.press,
      child: AnimatedContainer(
        duration: defaultDuration,
        margin: const EdgeInsets.only(right: 16),
        padding: const EdgeInsets.all(8),
        height: 48,
        width: 48,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: kPrimaryColor.withOpacity(widget.isSelected ? 1 : 0)),
        ),
        child: Image.asset(widget.image),
      ),
    );
  }
}
