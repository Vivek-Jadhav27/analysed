import 'package:flutter/material.dart';

class Product {
  int pid;
  String name;
  String description;
  double price;
  bool inStock;
  int quantity;

  Product({
    required this.pid,
    required this.name,
    required this.description,
    required this.price,
    required this.inStock,
    required this.quantity,
  });
}

class ProductProvider extends ChangeNotifier {
  List<Product> products = [
    Product(
      pid: 1,
      name: 'Product 1',
      description: 'Description 1',
      price: 19.99,
      inStock: true,
      quantity: 0,
    ),
    Product(
      pid: 2,
      name: 'Product 2',
      description: 'Description 2',
      price: 29.99,
      inStock: false,
      quantity: 0,
    ),
    Product(
      pid: 3,
      name: 'Product 3',
      description: 'Description 3',
      price: 39.99,
      inStock: true,
      quantity: 0,
    ),
    Product(
      pid: 4,
      name: 'Product 4',
      description: 'Description 4',
      price: 49.99,
      inStock: true,
      quantity: 0,
    ),
    Product(
      pid: 5,
      name: 'Product 5',
      description: 'Description 5',
      price: 59.99,
      inStock: false,
      quantity: 0,
    ),
  ];

  int? curIndex;

  void getCurIndex(int index) {
    curIndex = index;
    notifyListeners();
  }

  void increment() {
    products[curIndex!].quantity += 1;
    notifyListeners();
  }

  void decrement() {
    products[curIndex!].quantity -= 1;
    notifyListeners();
  }
}
