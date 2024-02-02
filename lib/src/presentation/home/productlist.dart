import 'package:flutter/material.dart';
import 'package:kioski/src/presentation/home/mainproduct.dart';
import 'package:kioski/src/presentation/home/product.dart';
import 'package:kioski/src/presentation/home/productpage.dart';
import 'package:provider/provider.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({Key? key}) : super(key: key);

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  int index = 0;
  List<String> selectedBrands = [];
  List<String> selectedColors = [];
  RangeValues priceRange = const RangeValues(0, 1000);

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (context, value, child) {
        return Scaffold(
         
          body: LayoutBuilder(
            builder: (context, constraints) {
              final screenWidth = constraints.maxWidth;
              final screenHeight = constraints.maxHeight;

              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Products",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: screenWidth * 0.04,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              _openFilterDrawer(context);
                            },
                            child: Container(
                              height: 30,
                              width: 120,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(0, 0, 0, 0.25),
                                      offset: Offset(0, 4),
                                      blurRadius: 25)
                                ],
                                color: Color.fromRGBO(249, 237, 154, 1),
                              ),
                              child: const Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.filter_alt_outlined,
                                      size: 18,
                                    ),
                                    Text(
                                      'Filter',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),

                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20.0,
                        mainAxisSpacing: 10.0,
                        mainAxisExtent: screenWidth > 600 ? 400 : 320,
                      ),
                      itemCount: value.products.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            value.getCurIndex(index);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MainProduct(
                                  product: value.products[index],
                                ),
                              ),
                            );
                          },
                          child: Container(
                            width: screenWidth * 0.3,
                            height: screenHeight * 0.40,
                            padding: EdgeInsets.only(
                              top: screenWidth * 0.02,
                              left: screenWidth * 0.02,
                              right: screenWidth * 0.02,
                            ),
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
                                          height: screenHeight * 0.26,
                                          decoration: const BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                "assets/images/Screenshot20240130at6311.png",
                                              ),
                                              fit: BoxFit.fill,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color.fromRGBO(
                                                    0, 0, 0, 0.25),
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
                                        height: 20,
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(8),
                                            topRight: Radius.circular(8),
                                            bottomLeft: Radius.circular(8),
                                            bottomRight: Radius.circular(8),
                                          ),
                                          color:
                                              Color.fromRGBO(217, 217, 217, 1),
                                        ),
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 8),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
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
                                            ]),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: screenWidth * 0.02, top: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        value.products[index].name,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: screenWidth * 0.02,
                                        ),
                                      ),
                                      Text(
                                        value.products[index].description,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: screenWidth * 0.02,
                                        ),
                                      ),
                                      Text(
                                        'Price: \$${value.products[index].price}',
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
                        );
                      },
                    )
                    // Texts below the image
                  ],
                ),
              );
            },
          ),
          endDrawer: _buildFilterDrawer(),
        );
      },
    );
  }

  void _openFilterDrawer(BuildContext context) {
    Scaffold.of(context).openEndDrawer(); // Open the end drawer
  }

  Widget _buildFilterDrawer() {
  return Drawer(
    backgroundColor: Color.fromRGBO(255, 190, 219, 1),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Filters',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: Icon(Icons.close, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Brands',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (String brand in ['Brand1', 'Brand2', 'Brand3'])
                      Row(
                        children: [
                          Checkbox(
                            value: selectedBrands.contains(brand),
                            onChanged: (bool? value) {
                              setState(() {
                                if (value != null) {
                                  if (value) {
                                    selectedBrands.add(brand);
                                  } else {
                                    selectedBrands.remove(brand);
                                  }
                                }
                              });
                            },
                          ),
                          Text(brand),
                        ],
                      ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: () {
                          // Apply Filters for Brands
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(0, 189, 143, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(72.0),
                          ),
                        ),
                        child: Text(
                          'Apply',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Colors',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (String color in ['Red', 'Blue', 'Green'])
                      Row(
                        children: [
                          Checkbox(
                            value: selectedColors.contains(color),
                            onChanged: (bool? value) {
                              setState(() {
                                if (value != null) {
                                  if (value) {
                                    selectedColors.add(color);
                                  } else {
                                    selectedColors.remove(color);
                                  }
                                }
                              });
                            },
                          ),
                          Text(color),
                        ],
                      ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: () {
                          // Apply Filters for Brands
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(0, 189, 143, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(72.0),
                          ),
                        ),
                        child: Text(
                          'Apply',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'Price Range',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16),
                    Slider(
                      value: priceRange.end,
                      onChanged: (double value) {
                        setState(() {
                          priceRange = RangeValues(priceRange.start, value);
                        });
                      },
                      min: 0,
                      max: 20000,
                      divisions: 100,
                      label: 'Selected Price: Rs ${priceRange.end}',
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Selected Price: Rs ${priceRange.end.round().toString()}',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 16),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: () {
                          // Apply Filters for Price Range
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(0, 189, 143, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(72.0),
                          ),
                        ),
                        child: Text(
                          'Apply',
                          style: TextStyle(color: Colors.white),
                        ),
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
  );
}

}
