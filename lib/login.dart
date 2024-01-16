import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myopia/signup.dart';
import 'app_colors.dart';
import 'background.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String emailError = '';
  String passwordError = '';
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final ValueNotifier<bool> isPasswordVisible = ValueNotifier<bool>(false);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Container(
            width: screenWidth,
            height: screenHeight,
            decoration: BoxDecoration(
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
                          top: screenHeight * 0.580,
                          bottom: screenHeight * 0.020,
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
                          textAlign: TextAlign.start,
                          controller: emailController,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 20),
                              hintText: 'Email',
                              hintStyle: TextStyle(fontFamily: "Inter"),
                              border: InputBorder.none,
                              errorText: emailError),
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
                                textAlign: TextAlign.start,
                                controller:
                                    passwordController, // Assign the controller
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(left: 20),
                                  hintText: 'Password',
                                  hintStyle: TextStyle(fontFamily: "Inter"),
                                  border: InputBorder.none,
                                  errorText: passwordError,
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
                                      color: Color.fromRGBO(171, 171, 171, 1),
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
                      alignment: Alignment.centerRight,
                      margin: EdgeInsets.only(
                          top: screenHeight * 0.010,
                          bottom: screenHeight * 0.020,
                          left: screenWidth * 0.053,
                          right: screenWidth * 0.053),
                      child: const Text(
                        'Forget Password',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          color: Color.fromRGBO(56, 56, 56, 1),
                          fontFamily: 'Inter',
                          fontSize: 14,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (emailController.text.isNotEmpty &&
                            passwordController.text.length > 8) {
                          login();
                        } else {
                          debugPrint('LOG : Not Valid');
                        }
                      },
                      child: Container(
                        width: screenWidth * 0.350,
                        height: screenHeight * 0.057,
                        margin: EdgeInsets.only(
                            bottom: screenHeight * 0.05,
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
                            'Login ',
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Don’t have an account? ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromRGBO(56, 56, 56, 1),
                              fontFamily: 'Inter',
                              fontSize: 14,
                              letterSpacing: 0,
                              fontWeight: FontWeight.normal,
                              height: 1),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignUp()));
                          },
                          child: const Text(
                            'Sign Up',
                            textAlign: TextAlign.center,
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
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> login() async {
    try {
      showLoadingIndicator();

      final auth = FirebaseAuth.instance;
      await auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);

      hideLoadingIndicator();

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Login Successful.'),
      ));
    } catch (e) {
      print('Login failed: $e');
      hideLoadingIndicator();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Login failed. Please check your credentials.'),
      ));
    }
  }

  void showLoadingIndicator() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  void hideLoadingIndicator() {
    Navigator.of(context, rootNavigator: true).pop();
  }
}
