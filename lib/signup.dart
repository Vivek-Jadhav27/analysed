import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:myopia/firebaseService.dart';
import 'package:myopia/login.dart';
import 'app_colors.dart';
import 'background.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final ValueNotifier<bool> isPasswordVisible = ValueNotifier<bool>(false);
    final ValueNotifier<bool> isConfrimPasswordVisible =
        ValueNotifier<bool>(false);
    int _isterm = 1;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
            child: Container(
                width: screenWidth,
                height: screenHeight,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(15, 164, 220, 1),
                ),
                child: Stack(
                  children: <Widget>[
                    Background(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: screenWidth,
                          height: screenHeight * 0.057,
                          margin: EdgeInsets.only(
                              top: screenHeight * 0.550,
                              bottom: screenHeight * 0.010,
                              left: screenWidth * 0.053,
                              right: screenWidth * 0.053),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color.fromRGBO(217, 217, 217, 0),
                            border: Border.all(
                              color: AppColors.darkblue,
                              width: 1,
                            ),
                          ),
                          child: Center(
                            child: TextField(
                              controller: nameController,
                              textAlign: TextAlign.start,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.only(left: 20),
                                hintText: 'Name',
                                hintStyle: TextStyle(fontFamily: "Inter"),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: screenWidth,
                          height: screenHeight * 0.057,
                          margin: EdgeInsets.only(
                              bottom: screenHeight * 0.010,
                              left: screenWidth * 0.053,
                              right: screenWidth * 0.053),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color.fromRGBO(217, 217, 217, 0),
                            border: Border.all(
                              color: AppColors.darkblue,
                              width: 1,
                            ),
                          ),
                          child: Center(
                            child: TextField(
                              controller: emailController,
                              textAlign: TextAlign.start,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.only(left: 20),
                                hintText: 'Email',
                                hintStyle: TextStyle(fontFamily: "Inter"),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: screenWidth,
                          height: screenHeight * 0.057,
                          margin: EdgeInsets.only(
                            bottom: screenHeight * 0.010,
                            left: screenWidth * 0.053,
                            right: screenWidth * 0.053,
                          ),
                          padding: EdgeInsets.only(
                            right: screenWidth * 0.020,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color.fromRGBO(217, 217, 217, 0),
                            border: Border.all(
                              color: AppColors.darkblue,
                              width: 1,
                            ),
                          ),
                          child: Center(
                            widthFactor: screenWidth,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: TextField(
                                    controller: passwordController,
                                    textAlign: TextAlign.start,
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.only(left: 20),
                                      hintText: 'Password',
                                      hintStyle: TextStyle(fontFamily: "Inter"),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    isPasswordVisible.value =
                                        !isPasswordVisible.value;
                                  },
                                  child: Center(
                                    child: Container(
                                      child: ValueListenableBuilder<bool>(
                                        valueListenable: isPasswordVisible,
                                        builder: (_, isVisible, __) => Icon(
                                          isVisible
                                              ? Icons.visibility_off_outlined
                                              : Icons.visibility,
                                          size: 30,
                                          color:
                                              Color.fromRGBO(171, 171, 171, 1),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: screenWidth,
                          height: screenHeight * 0.057,
                          margin: EdgeInsets.only(
                            left: screenWidth * 0.053,
                            right: screenWidth * 0.053,
                          ),
                          padding: EdgeInsets.only(
                            right: screenWidth * 0.020,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color.fromRGBO(217, 217, 217, 0),
                            border: Border.all(
                              color: AppColors.darkblue,
                              width: 1,
                            ),
                          ),
                          child: Center(
                            widthFactor: screenWidth,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: TextField(
                                    controller: confirmpasswordController,
                                    textAlign: TextAlign.start,
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.only(left: 20),
                                      hintText: 'Re-enter Password',
                                      hintStyle: TextStyle(fontFamily: "Inter"),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    isConfrimPasswordVisible.value =
                                        !isConfrimPasswordVisible.value;
                                  },
                                  child: Center(
                                    child: Container(
                                      child: ValueListenableBuilder<bool>(
                                        valueListenable:
                                            isConfrimPasswordVisible,
                                        builder: (_, isVisible, __) => Icon(
                                          isVisible
                                              ? Icons.visibility_off_outlined
                                              : Icons.visibility,
                                          size: 30,
                                          color:
                                              Color.fromRGBO(171, 171, 171, 1),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            width: screenWidth,
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(
                                top: screenHeight * 0.010,
                                bottom: screenHeight * 0.020,
                                left: screenWidth * 0.070,
                                right: screenWidth * 0.053),
                            child: Row(
                              children: [
                                Radio(
                                    value: 0,
                                    groupValue: _isterm,
                                    onChanged: (value) {
                                      setState(() {
                                        _isterm = value!;
                                      });
                                    }),
                                const Text(
                                  textAlign: TextAlign.start,
                                  'terms and conditions',
                                  style: TextStyle(
                                      color: Color.fromRGBO(56, 56, 56, 1),
                                      fontFamily: 'Inter',
                                      fontSize: 14,
                                      letterSpacing: 0,
                                      decoration: TextDecoration.underline,
                                      decorationColor: Colors.black, // optional
                                      decorationThickness: 2, // optional
                                      decorationStyle:
                                          TextDecorationStyle.solid, // optional
                                      fontWeight: FontWeight.normal,
                                      height: 1),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            signup();
                          },
                          child: Container(
                            width: screenWidth * 0.350,
                            height: screenHeight * 0.057,
                            margin: EdgeInsets.only(
                                bottom: screenHeight * 0.01,
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
                                'Sign Up ',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Inter',
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: TextStyle(
                              color: Color.fromRGBO(56, 56, 56, 1),
                              fontFamily: 'Inter',
                              fontSize: 14,
                            ),
                            children: [
                              TextSpan(
                                text: 'Already have an account? ',
                              ),
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Login())),
                                text: 'Log In',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ))));
  }

  Future<void> signup() async {
    try {
      final auth = FirebaseAuth.instance;
      await auth.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);

      User? user = auth.currentUser;
      if (user != null) {
        String userId = user.uid;
        FirebaseServices firebaseServices = FirebaseServices();

        await firebaseServices.addUser(
            userId, nameController.text, emailController.text);

        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Sign Up Successful.'),
        ));
      }
    } catch (e) {
      print('Login failed: $e');
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Login failed. Please check your credentials.'),
      ));
    }
  }
}
