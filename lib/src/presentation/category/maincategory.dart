import 'package:flutter/material.dart';

class MainCategory extends StatefulWidget {
  const MainCategory({super.key});

  @override
  State<MainCategory> createState() => _MainCategoryState();
}

class _MainCategoryState extends State<MainCategory> {
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