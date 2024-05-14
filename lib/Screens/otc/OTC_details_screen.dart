import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../models/OTC_meds.dart';
import '../Views/about_med.dart';
import '../cart/cart_screen.dart';
import '../favorite/FavoriteProvider.dart';
import 'components/product_description.dart';
import 'components/product_images.dart';
import 'components/top_rounded_container.dart';
import 'package:final_project/Screens/cart/components/CartProvider.dart';

class OTCDetailsScreen extends StatefulWidget {
  static String routeName = "/details";

  const OTCDetailsScreen({Key? key}) : super(key: key);

  @override
  _OTCDetailsScreenState createState() => _OTCDetailsScreenState();
}

class _OTCDetailsScreenState extends State<OTCDetailsScreen> {
  int selectedOption = 1; // Initialize the selected option

  late FavoritesProvider favoritesProvider; // Declare favorites provider

  @override
  void initState() {
    super.initState();
    favoritesProvider = Provider.of<FavoritesProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    final ProductDetailsArguments args =
    ModalRoute.of(context)!.settings.arguments as ProductDetailsArguments;
    final Product product = args.product;

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
            // Remove the cart icon from the app bar
          ),
          body: ListView(
            children: [
              ProductImages(product: product),
              TopRoundedContainer(
                color: Colors.white,
                child: Column(
                  children: [
                    ProductDescription(
                      product: product,
                      pressOnSeeMore: () {},
                    ),
                    TopRoundedContainer(
                      color: const Color(0xFFF6F7F9),
                      child: Column(
                        children: [
                          // ColorDots(product: product),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              AddToCartCard(
                product: product,
                quantity: 1, // Provide the quantity here
                onTap: () {
                  cartProvider.addToCart(product, 1); // Use the quantity here
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartScreen()),
                  );
                },
              ),
              SizedBox(height: 10.sp),
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
              // AboutMedicine Widget goes here
              AboutMedicine(),
              SizedBox(height: 50.sp),
            ],
          ),
        );
      },
    );
  }

  // Function to handle adding to favorites
  void addToFavorites(Product product) {
    favoritesProvider.addToFavorites(product);
  }
}

class ProductDetailsArguments {
  final Product product;

  ProductDetailsArguments({required this.product});
}

class AddToCartCard extends StatelessWidget {
  final Product product;
  final int quantity;
  final VoidCallback onTap;

  const AddToCartCard({
    Key? key,
    required this.product,
    required this.quantity,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 30.sp,
        margin: EdgeInsets.symmetric(horizontal: 20.sp),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 0, 136, 102),
          borderRadius: BorderRadius.circular(15.sp),
        ),
        alignment: Alignment.center,
        child: Text(
          'Add to Cart',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
