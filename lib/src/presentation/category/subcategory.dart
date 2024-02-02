import 'package:flutter/material.dart';

class SubCategory extends StatefulWidget {
  const SubCategory({super.key});

  @override
  State<SubCategory> createState() => _SubCategoryState();
}

class _SubCategoryState extends State<SubCategory> {
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Container(
            color: Colors.pink,
            child: Center(
              child: Text(
                "Top",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width *0.20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.blue,
            child: Center(
              child: Text(
                "Bottom",
                style: TextStyle(
                  fontSize:  MediaQuery.of(context).size.width *0.20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.yellow,
            child: Center(
              child: Text(
                "Outfit",
                style: TextStyle(
                  fontSize:  MediaQuery.of(context).size.width *0.20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        )
      ],
    ));
}
}