import 'package:flutter/material.dart';

class GenderCategory extends StatefulWidget {
  const GenderCategory({super.key});

  @override
  State<GenderCategory> createState() => _GenderCategoryState();
}

class _GenderCategoryState extends State<GenderCategory> {
  

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
                "Man",
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
                "Woman",
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
                "Kid",
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

