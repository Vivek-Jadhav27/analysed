import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:kioski/src/presentation/home/cartpage.dart';
import 'package:kioski/src/presentation/home/product.dart';
import 'package:provider/provider.dart';

import 'cart.dart';

class MainProduct extends StatefulWidget {
   final Product product;
  const MainProduct({Key? key, required this.product}) : super(key: key);

  @override
  State<MainProduct> createState() => _MainProductState();
}

class _MainProductState extends State<MainProduct> {
  final List<String> images = [
    "assets/images/Screenshot20240130at6311.png",
    "assets/images/Screenshot20240130at6311.png",
    "assets/images/Screenshot20240130at6311.png",
  ];

  int _currentIndex = 0;
  final CarouselController _carouselController = CarouselController();

  Color? selectedColor;
  String? selectedSize;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Consumer2<ProductProvider, CartProvider>(
     builder: (context, value, cartProvider, child) {
        return Scaffold(
           appBar: AppBar(actions: [
           
          ]),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider(
                carouselController: _carouselController,
                options: CarouselOptions(
                  height: 400.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                ),
                items: images.map((image) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                        ),
                        child: Image.asset(
                          image,
                          fit: BoxFit.fill,
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  images.length,
                  (index) => buildIndicator(index),
                ),
              ),
              Text(
                widget.product.name,
                style: TextStyle(fontSize: 30, color: Colors.black),
              ),
              Text(
                widget.product.description,
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
              Container(
                height: 30,
                width: 80 ,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                  color: Color.fromRGBO(217, 217, 217, 1),
                ),
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "4.3 ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: screenWidth * 0.02,
                      ),
                    ),
                    Icon(
                      Icons.star,
                      size: screenWidth * 0.02,
                    )
                  ],
                ),
              ),
              Text(
                widget.product.price.toStringAsFixed(2),
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                ),
              ),
              Row(
                children: [
                  buildColorContainer(Colors.red),
                  buildColorContainer(Colors.blue),
                  buildColorContainer(Colors.green),
                ],
              ),
              Row(
                children: [
                  buildSizeContainer("S"),
                  buildSizeContainer("M"),
                  buildSizeContainer("L"),
                  buildSizeContainer("XL"),
                ],
              ),
              Container(
                width: 461,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color.fromRGBO(237, 129, 177, 1),
                ),
                child: GestureDetector(
                  onTap: () {
                    cartProvider.addToCart(widget.product);
                    print("Selected Color: $selectedColor");
                    print("Selected Size: $selectedSize");
                     Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartPage()),
                  );
                  },
                  child: Center(
                    child: Text(
                      "Add to cart",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                'Suggested Products',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Container(
                    width: screenWidth * 0.3,
                    height: screenWidth * 0.3,
                    padding: EdgeInsets.all(screenWidth * 0.02),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.25),
                          offset: Offset(0, 4),
                          blurRadius: 25,
                        )
                      ],
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Positioned(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  width: screenWidth * 0.3,
                                  height: screenWidth * 0.21,
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
                              ),
                            ),
                            // Overlay text
                            Positioned(
                              bottom: screenWidth * 0.01,
                              left: screenWidth * 0.03,
                              child: Container(
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    topRight: Radius.circular(8),
                                    bottomLeft: Radius.circular(8),
                                    bottomRight: Radius.circular(8),
                                  ),
                                  color: Color.fromRGBO(217, 217, 217, 1),
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "4.3 ",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: screenWidth * 0.02,
                                      ),
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: screenWidth * 0.02,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: screenWidth * 0.02, top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                value.products[_currentIndex].name,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: screenWidth * 0.02,
                                ),
                              ),
                              Text(
                                value.products[_currentIndex].description,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: screenWidth * 0.02,
                                ),
                              ),
                              Text(
                                'Price: \$${value.products[_currentIndex].price}',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: screenWidth * 0.02,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildIndicator(int index) {
    return Container(
      width: 8.0,
      height: 8.0,
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentIndex == index ? Colors.blue : Colors.grey,
      ),
    );
  }

  Widget buildColorContainer(Color color) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedColor = color;
        });
      },
      child: Container(
        width: 100,
        height: 100,
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.elliptical(150, 150)),
          border: Border.all(
            color: selectedColor == color ? Colors.blue : Color.fromRGBO(0, 0, 0, 0),
            width: 2,
          ),
        ),
      ),
    );
  }

  Widget buildSizeContainer(String size) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedSize = size;
        });
      },
      child: Container(
        width: 100,
        height: 100,
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.elliptical(150, 150)),
          border: Border.all(
            color: selectedSize == size ? Colors.blue : Colors.black,
            width: 2,
          ),
        ),
        child: Center(
          child: Text(
            size,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
        ),
      ),
    );
  }
}
