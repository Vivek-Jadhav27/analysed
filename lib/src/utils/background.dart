import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 1080,
        height: 1920,
        decoration: BoxDecoration(
          color: Color.fromRGBO(249, 237, 154, 1),
        ),
        child: Stack(children: <Widget>[
          Positioned(
            top: 363,
            left: -243,
            child: Container(
              width: 1300,
              height: 1300,
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, 1),
                borderRadius: BorderRadius.all(Radius.elliptical(1300, 1300)),
              ),
            ),
          ),
          Positioned(
            top: 536,
            left: 120,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 236, 136, 1),
                borderRadius: BorderRadius.all(Radius.elliptical(100, 100)),
              ),
            ),
          ),
          Positioned(
            top: 176,
            left: 187,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 190, 219, 1),
                borderRadius: BorderRadius.all(Radius.elliptical(100, 100)),
              ),
            ),
          ),
          Positioned(
              top: -93,
              left: 720,
              child: Container(
                  width: 600,
                  height: 600,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 190, 219, 1),
                    borderRadius: BorderRadius.all(Radius.elliptical(600, 600)),
                  ))),
          Positioned(
              top: 1713,
              left: 457,
              child: Container(
                  width: 600,
                  height: 600,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 190, 219, 1),
                    borderRadius: BorderRadius.all(Radius.elliptical(600, 600)),
                  ))),
        ]));
  }
}
