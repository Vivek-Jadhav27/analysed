import 'package:flutter/material.dart';
import 'package:kioski/src/presentation/category/gendercategory.dart';
import 'package:kioski/src/presentation/home/mainproduct.dart';
import 'package:kioski/src/presentation/home/productlist.dart';
import 'package:kioski/src/utils/background.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 1080,
        height: 1920,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(249, 237, 154, 1),
        ),
        child: Stack(
          children: <Widget>[
            const Background(),
            const Positioned(
              top: 539,
              left: 139,
              child: Text(
                'Login',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'Inter',
                    fontSize: 80,
                    letterSpacing: 0,
                    fontWeight: FontWeight.normal,
                    height: 1),
              ),
            ),
            const Positioned(
              top: 108,
              left: 86,
              child: Text(
                'Welcome To,\nOur Company.',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 1),
                    fontFamily: 'Inter',
                    fontSize: 64,
                    letterSpacing:
                        0 /*percentages not used in flutter. defaulting to zero*/,
                    fontWeight: FontWeight.normal,
                    height: 1),
              ),
            ),
            const Positioned(
              top: 1373,
              left: 496,
              child: Text(
                'Get started',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontFamily: 'Inter',
                    fontSize: 40,
                    letterSpacing: 0,
                    fontWeight: FontWeight.normal,
                    height: 1),
              ),
            ),
            Positioned(
              top: 705,
              left: 54,
              child: Container(
                width: 843,
                height: 120,
                padding: const EdgeInsets.only(left: 30),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(77),
                    topRight: Radius.circular(77),
                    bottomLeft: Radius.circular(77),
                    bottomRight: Radius.circular(77),
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.25),
                        offset: Offset(0, 4),
                        blurRadius: 30)
                  ],
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
                child: Center(
                  child: TextField(
                    textAlign: TextAlign.start,
                    controller: _nameController,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(left: 20),
                      hintText: "Name",
                      hintStyle: TextStyle(fontFamily: "Inter", fontSize: 40),
                      border: InputBorder.none,
                    ),
                    style: const TextStyle(
                        fontSize: 40,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 919,
              left: 52,
              child: Container(
                width: 843,
                height: 120,
                padding: const EdgeInsets.only(left: 30),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(77),
                    topRight: Radius.circular(77),
                    bottomLeft: Radius.circular(77),
                    bottomRight: Radius.circular(77),
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.25),
                        offset: Offset(0, 4),
                        blurRadius: 30)
                  ],
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
                child: Center(
                  child: TextField(
                    textAlign: TextAlign.start,
                    controller: _emailController,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(left: 20),
                      hintText: "Email ",
                      hintStyle: TextStyle(fontFamily: "Inter", fontSize: 40),
                      border: InputBorder.none,
                    ),
                    style: const TextStyle(
                        fontSize: 40,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 1133,
              left: 52,
              child: Container(
                width: 843,
                height: 120,
                padding: const EdgeInsets.only(left: 30),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(77),
                    topRight: Radius.circular(77),
                    bottomLeft: Radius.circular(77),
                    bottomRight: Radius.circular(77),
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.25),
                        offset: Offset(0, 4),
                        blurRadius: 30)
                  ],
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
                child: Center(
                  child: TextField(
                    textAlign: TextAlign.start,
                    controller: _mobileController,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(left: 20),
                      hintText: "Mobile Number",
                      hintStyle: TextStyle(fontFamily: "Inter", fontSize: 40),
                      border: InputBorder.none,
                    ),
                    style: const TextStyle(
                        fontSize: 40,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 1347,
              left: 368,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProductListPage()),
                  );
                },
                child: Container(
                  width: 461,
                  height: 100,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                    color: Color.fromRGBO(237, 129, 177, 1),
                  ),
                  child: const Center(
                    child: Text(
                      "Get Started",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Clean up controllers when the widget is disposed
    _nameController.dispose();
    _emailController.dispose();
    _mobileController.dispose();
    super.dispose();
  }
}
