import 'package:flutter/material.dart';
import '../../../models/Cart.dart';
import '../../../models/OTC_meds.dart'; // Import your Product model

class CartProvider extends ChangeNotifier {
  List<Cart> _cartItems = [];

  List<Cart> get cartItems => _cartItems;

  void addToCart(Product product, int quantity) {
    bool itemExists = false;
    for (var item in _cartItems) {
      if (item.product.id == product.id) {
        item.numOfItem += quantity;
        itemExists = true;
        break;
      }
    }
    if (!itemExists) {
      _cartItems.add(Cart(product: product, numOfItem: quantity));
    }
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _cartItems.removeWhere((item) => item.product.id == product.id);
    notifyListeners();
  }

// Other cart management methods can be added here
}
