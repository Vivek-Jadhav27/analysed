import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:myopia/screens/signup.dart';
import 'package:myopia/services/firebaseServices.dart';
import 'package:myopia/services/loginServices.dart';
import 'package:myopia/component/uihelpers.dart';
import '../component/app_colors.dart';
import '../component/background.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ValueNotifier<bool> isPasswordVisible = ValueNotifier<bool>(true);

  String emailError = '';
  String passwordError = '';
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Container(
            width: screenWidth,
            height: screenHeight,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(15, 164, 220, 1),
            ),
            child: Stack(
              children: <Widget>[
                const Background(),
                Container(
                  margin: EdgeInsets.only(
                    top: screenHeight * 0.600,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      UIHelpers().buildInputTextField(
                          "Email", emailController, screenWidth, screenHeight),
                      _buildInputPasswordField("Password", passwordController,
                          screenWidth, screenHeight),
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
                      _buildLoginButton(screenWidth, screenHeight),
                      const SizedBox(
                        height: 20,
                      ),
                      RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: const TextStyle(
                              color: Color.fromRGBO(56, 56, 56, 1),
                              fontFamily: 'Inter',
                              fontSize: 14,
                            ),
                            children: [
                              const TextSpan(
                                text: 'Don’t have an account? ',
                              ),
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SignUp())),
                                text: 'Sign Up',
                                style: const TextStyle(
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          )
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton(double width, double height) {
    return GestureDetector(
        onTap: () {
          if (LoginServices().validateEmail(context, emailController.text) &&
              LoginServices().validatePassword(
                  context, passwordController.text, passwordController.text)) {
            FirebaseServces()
                .login(emailController.text, passwordController.text, context);
          } else {
            debugPrint('LOG : Not Valid');
          }
        },
        child: UIHelpers().buildLoginButton("Login", width, height));
  }

  Widget _buildInputPasswordField(String text, TextEditingController controller,
      double width, double height) {
    return Container(
      width: width,
      height: height * 0.057,
      margin: EdgeInsets.only(
          left: width * 0.053, right: width * 0.053, bottom: height * 0.010),
      padding: EdgeInsets.only(
        right: width * 0.020,
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
        widthFactor: width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: width * 0.750,
              child: TextField(
                obscureText: isPasswordVisible.value,
                textAlign: TextAlign.start,
                controller: controller,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(left: 20),
                  hintText: text,
                  hintStyle: const TextStyle(fontFamily: "Inter"),
                  border: InputBorder.none,
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  isPasswordVisible.value = !isPasswordVisible.value;
                });
              },
              color: const Color.fromRGBO(171, 171, 171, 1),
              iconSize: 30,
              icon: Icon(isPasswordVisible.value
                  ? Icons.visibility_off_outlined
                  : Icons.visibility),
            ),
          ],
        ),
      ),
    );
  }
}
