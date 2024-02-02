import 'package:flutter/material.dart';
import 'package:kioski/src/presentation/home/product.dart';
import 'package:provider/provider.dart';

import 'cart.dart';

class ProductPage extends StatefulWidget {
  final Product product;
  const ProductPage({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<ProductProvider, CartProvider>(
      builder: (context, value, cartProvider, child) => Scaffold(
        appBar: AppBar(
          title: Text('Product Page'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 120,
                  height: 120,
                  color: Colors.blue, // Example product image or icon
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.product.name,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(widget.product.description),
                      const SizedBox(height: 8),
                      Text(
                        'Price: \$${widget.product.price.toStringAsFixed(2)}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'In Stock: ${widget.product.inStock ? 'Yes' : 'No'}',
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: value.decrement,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.blue,
                              ),
                              padding: const EdgeInsets.all(8),
                              child:
                                  const Icon(Icons.remove, color: Colors.white),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '${value.products[value.curIndex!].quantity}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 8),
                          GestureDetector(
                            onTap: value.increment,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.blue,
                              ),
                              padding: const EdgeInsets.all(8),
                              child: const Icon(Icons.add, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          cartProvider.addToCart(widget.product);

                          print(
                            'Product added to cart! Quantity: ${value.products[value.curIndex!].quantity}',
                          );
                        },
                        child: const Text('Add to Cart'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
