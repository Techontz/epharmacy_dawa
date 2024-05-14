import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../NotificationScreen.dart';
import 'package:provider/provider.dart';
import '../../cart/components/CartProvider.dart';
import '../../otc/components/icon_btn_with_counter.dart'; // Import your CartProvider

class UpperCard extends StatefulWidget {
  final TextEditingController searchText;

  const UpperCard({Key? key, required this.searchText}) : super(key: key);

  @override
  _UpperCardState createState() => _UpperCardState();
}

class _UpperCardState extends State<UpperCard> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context); // Listen to changes in the cart

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.indigo.withOpacity(0.3),
            Colors.white.withOpacity(0.3),
            Colors.indigo.withOpacity(0.3),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.1, 0.5, 0.8],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                'What medicine\ndo you need?',
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              _searchBar(context, widget.searchText),
            ],
          ),
          Positioned(
            top: 30,
            right: 5,
            child: Row(
              children: [
                SizedBox(width: 8),
                IconBtnWithCounter(
                  svgSrc: "assets/icons/Cart Icon.svg",
                  numOfitem: cartProvider.cartItems.length,
                  press: () {
                    Navigator.pushNamed(context, '/cart');
                  },
                ),
                SizedBox(width: 16), // Adjust the spacing as needed
                IconBtnWithCounter(
                  svgSrc: "assets/icons/Bell.svg",
                  numOfitem: 4, // Example value for the notification count
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NotificationScreen()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _searchBar(BuildContext context, TextEditingController searchText) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        width: MediaQuery.of(context).size.width * 0.97,
        child: TextFormField(
          controller: searchText,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            hintText: 'Search medicine...',
            contentPadding: const EdgeInsets.all(10),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            suffixIcon: InkWell(
              child: Icon(
                Icons.clear,
                color: Colors.black,
              ),
              onTap: () {
                searchText.clear();
              },
            ),
          ),
          style: TextStyle(color: Colors.black),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              offset: const Offset(0, 2),
              blurRadius: 5,
            ),
          ],
        ),
      ),
    );
  }
}
