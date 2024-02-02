import 'package:flutter/material.dart';
import 'package:kioski/src/presentation/home/cart.dart';
import 'package:kioski/src/presentation/home/product.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          List<Product> cartItems = cartProvider.cart.items;

          if (cartItems.isEmpty) {
            return Center(
              child: Text('Your cart is empty.'),
            );
          }

          double total = 0.0;

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    Product product = cartItems[index];
                    total += product.price;

                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 120,
                              height: 120,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    "assets/images/Screenshot20240130at6311.png",
                                  ),
                                  fit: BoxFit.fill,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.25),
                                    offset: Offset(0, 4),
                                    blurRadius: 25,
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  cartItems[index].name,
                                  style:
                                      TextStyle(color: Colors.black, fontSize: 30),
                                ),
                                Text(
                                  cartItems[index].description,
                                  style:
                                      TextStyle(color: Colors.grey, fontSize: 20),
                                ),
                                Text(
                                  cartItems[index].price.toStringAsFixed(2),
                                  style:
                                      TextStyle(color: Colors.black, fontSize: 30),
                                ),
                              ],
                            ),
                          ],
                        ),
                       
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 236, 136, 1),
                            borderRadius:
                                BorderRadius.all(Radius.elliptical(130, 130)),
                          ),
                          child: Center(
                              child: Text(
                            "1 *",
                            style: TextStyle(color: Colors.black, fontSize: 30),
                          )),
                        )
                      ],
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Total Price: \$${total.toStringAsFixed(2)}'),
              ),
            ],
          );
        },
      ),
      floatingActionButton: Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          return FloatingActionButton(
            onPressed: () {
              cartProvider.clearCart();
            },
            child: Icon(Icons.clear),
          );
        },
      ),
    );
  }
}
