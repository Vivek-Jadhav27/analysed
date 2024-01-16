import 'package:flutter/material.dart';
import 'dart:math' as math;

class Background1 extends StatefulWidget {
  const Background1({super.key});

  @override
  State<Background1> createState() => _Background1State();
}

class _Background1State extends State<Background1> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
        width: screenWidth,
        height: screenHeight,
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 1),
        ),
        child: Stack(children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 15, bottom: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: screenHeight * 0.05,
                  height: screenHeight * 0.05,
                  margin: EdgeInsets.only(right: 15, left: 15),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(217, 217, 217, 1),
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                const Text(
                  'Application',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Inter',
                      fontSize: 20,
                      height: 1),
                ),
              ],
            ),
          ),
          // DOne
          Positioned(
            left: screenWidth * 0.900,
            bottom: -screenHeight * 0.04,
            child: Transform.rotate(
              angle: 110.20999993891743 * (math.pi / 180),
              child: Container(
                margin: EdgeInsets.only(top: 30, left: 20),
                width: screenWidth * 0.900,
                height: screenHeight * 0.430,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(57),
                  color: Color.fromRGBO(24, 174, 224, 1),
                ),
                padding: EdgeInsets.all(30),
                child: Center(
                  child: Container(
                    width: screenWidth * 0.900,
                    height: screenHeight * 0.430,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(57),
                      color: Color.fromRGBO(68, 190, 231, 1),
                    ),
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            bottom: -screenHeight * 0.42,
            left: -screenWidth * 0.23,
            child: Transform.rotate(
                angle: 19.47 * (math.pi / 180),
                child: Container(
                  margin: EdgeInsets.only(top: 30, left: 20),
                  width: screenWidth * 1.5,
                  height: screenHeight * 0.450,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(57),
                    color: Color.fromRGBO(24, 174, 224, 1),
                  ),
                  padding: EdgeInsets.all(30),
                  child: Center(
                    child: Container(
                      width: screenWidth * 1.5,
                      height: screenHeight * 0.450,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(57),
                        color: Color.fromRGBO(68, 190, 231, 1),
                      ),
                    ),
                  ),
                )),
          )
        ]));
  }
}
