import 'package:flutter/material.dart';
import '../component/app_colors.dart';
import '../component/background.dart';
import '../component/uihelpers.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        color: AppColors.darkblue,
        child: Stack(
          children: <Widget>[
            const Background(),
            Container(
              margin: EdgeInsets.only(
                top: screenHeight * 0.630,
              ),
              child: Column(
                children: [
                  UIHelpers().buildLoginPageButton("Log In", screenWidth, screenHeight,context),
                  const SizedBox(height: 20),
                  UIHelpers().buildLoginPageButton("Sign Up", screenWidth, screenHeight,context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  }
