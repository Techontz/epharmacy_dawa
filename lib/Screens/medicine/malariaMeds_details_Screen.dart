import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../models/Malaria_meds.dart';
import '../Views/about_med.dart';
import '../Views/uploadPrescription.dart';
import '../cart/components/CartProvider.dart';
import '../favorite/FavoriteProvider.dart';
import '../otc/components/top_rounded_container.dart';
import 'malaria/components/malariaMeds_Image.dart';
import 'malaria/components/malariaMeds_description.dart';


class MalariaMedsDetailsScreen extends StatefulWidget {
  static String routeName = "/malaria_details";

  const MalariaMedsDetailsScreen({Key? key}) : super(key: key);

  @override
  _MalariaMedsDetailsScreenState createState() => _MalariaMedsDetailsScreenState();
}

class _MalariaMedsDetailsScreenState extends State<MalariaMedsDetailsScreen> {
  late FavoritesProvider favoritesProvider;

  @override
  void initState() {
    super.initState();
    favoritesProvider = Provider.of<FavoritesProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    final MalariaMedsDetailsArguments args =
    ModalRoute.of(context)!.settings.arguments as MalariaMedsDetailsArguments;
    final MalariaMeds malariaMeds = args.malariaMeds;

    final cartProvider = Provider.of<CartProvider>(context);

    return ResponsiveSizer(
      builder: (context, orientation, deviceType) {
        return Scaffold(
          extendBody: true,
          extendBodyBehindAppBar: true,
          backgroundColor: const Color(0xFFF5F6F9),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: Padding(
              padding: EdgeInsets.all(8.0.sp),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.zero,
                  elevation: 0,
                  backgroundColor: Colors.white,
                ),
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.black,
                  size: 20.sp,
                ),
              ),
            ),
          ),
          body: ListView(
            children: [
              MalariaMedsImages(malariaMeds: malariaMeds),
              TopRoundedContainer(
                color: Colors.white,
                child: Column(
                  children: [
                    MalariaMedsDescription(
                      malariaMeds: malariaMeds,
                      pressOnSeeMore: () {},
                    ),
                    TopRoundedContainer(
                      color: const Color(0xFFF6F7F9),
                      child: Column(
                        children: [
                          Card(
                            elevation: 4,
                            margin: EdgeInsets.all(16),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Order With Prescription',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => UploadPrescription(),
                                        ),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Color.fromARGB(255, 0, 136, 102),
                                    // Change the button's background color to green
                                    ),
                                    child: Text('Order Now',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 12.0.sp),
                color: Colors.grey[200],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Your code for the options
                  ],
                ),
              ),
              AboutMedicine(),
              SizedBox(height: 50.sp),
            ],
          ),
        );
      },
    );
  }
}

class MalariaMedsDetailsArguments {
  final MalariaMeds malariaMeds;

  MalariaMedsDetailsArguments({required this.malariaMeds});
}
