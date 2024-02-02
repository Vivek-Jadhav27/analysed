import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List<String> categories = ['Men', 'Women', 'Kids'];
  String selectedCategory = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedCategory.isEmpty
            ? 'Category Page'
            : '$selectedCategory Subcategories'),
      ),
      body: selectedCategory.isEmpty
          ? Column(
              children: categories
                  .map((category) => Expanded(
                        child: CategoryCard(
                          category: category,
                          onTap: () {
                            setState(() {
                              selectedCategory = category;
                            });
                          },
                        ),
                      ))
                  .toList(),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SubCategoryCard(subCategory: 'Top'),
                SubCategoryCard(subCategory: 'Bottom'),
                SubCategoryCard(subCategory: 'Outfit'),
              ],
            ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String category;
  final VoidCallback onTap;

  CategoryCard({required this.category, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: Colors.blue,
        child: Center(
          child: Text(
            category,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class SubCategoryCard extends StatelessWidget {
  final String subCategory;

  SubCategoryCard({required this.subCategory});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.green,
      child: Center(
        child: Text(
          subCategory,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}