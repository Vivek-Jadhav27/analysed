import 'package:flutter/foundation.dart';
import 'package:kioski/src/presentation/home/product.dart'; // Make sure to import this

class Cart with ChangeNotifier {
  List<Product> _items = [];

  List<Product> get items => _items;

  void addToCart(Product product) {
    _items.add(product);
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _items.remove(product);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}

class CartProvider with ChangeNotifier {
  Cart _cart = Cart();

  Cart get cart => _cart;

  // Other methods you might need

  void addToCart(Product product) {
    _cart.addToCart(product);
  }

  void removeFromCart(Product product) {
    _cart.removeFromCart(product);
  }

  void clearCart() {
    _cart.clearCart();
  }
}
