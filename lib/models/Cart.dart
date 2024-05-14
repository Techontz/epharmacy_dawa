

import 'OTC_meds.dart'; // Import your Product model

class Cart {
  final Product product;
  int numOfItem; // Change numOfItem to be non-final

  Cart({
    required this.product,
    required this.numOfItem,
  });
}
