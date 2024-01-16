import 'package:myopia/background.dart';
import 'package:flutter/material.dart';
import 'package:myopia/login.dart';
import 'package:myopia/signup.dart';
import 'app_colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

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
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Login()));
                  },
                  child: Container(
                    width: screenWidth,
                    height: screenHeight * 0.057,
                    margin: EdgeInsets.only(
                        top: screenHeight * 0.630,
                        left: screenWidth * 0.053,
                        right: screenWidth * 0.053),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                      border: Border.all(
                        color: AppColors.darkblue,
                        width: 1,
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Log In',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.darkblue,
                          fontFamily: 'Inter',
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const SignUp()));
                  },
                  child: Container(
                    width: screenWidth,
                    height: screenHeight * 0.057,
                    margin: EdgeInsets.only(
                        top: 20,
                        left: screenWidth * 0.053,
                        right: screenWidth * 0.053),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: AppColors.darkblue,
                      border: Border.all(
                        color: AppColors.darkblue,
                        width: 1,
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        'Sign Up',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Inter',
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
