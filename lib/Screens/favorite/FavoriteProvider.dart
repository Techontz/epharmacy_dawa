import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../../models/OTC_meds.dart'; // Assuming this is where your Product model is defined

class FavoritesProvider extends ChangeNotifier {
  List<Product> _favoriteProducts = [];

  List<Product> get favoriteProducts => _favoriteProducts;

  void addToFavorites(Product product) {
    _favoriteProducts.add(product);
    notifyListeners();
  }

  void removeFromFavorites(Product product) {
    _favoriteProducts.remove(product);
    notifyListeners();
  }

  void updateFavorites(List<Product> products) {
    _favoriteProducts = products;
    notifyListeners();
  }

  List<Product> getFavorites() {
    return _favoriteProducts;
  }
}
