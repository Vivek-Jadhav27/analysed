import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:myopia/services/firebaseServices.dart';
import '../component/app_colors.dart';
import '../component/background.dart';
import '../services/loginServices.dart';
import '../component/uihelpers.dart';
import 'login.dart';

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
  final ValueNotifier<bool> isPasswordVisible = ValueNotifier<bool>(true);
  final ValueNotifier<bool> isConfirmPasswordVisible =
      ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    String isterm = "";
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
                          top: screenHeight * 0.540,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            UIHelpers().buildInputTextField("Name",
                                nameController, screenWidth, screenHeight),
                            UIHelpers().buildInputTextField("Email",
                                emailController, screenWidth, screenHeight),
                            _buildInputPasswordField("Password",
                                passwordController, screenWidth, screenHeight),
                            _buildInputPasswordField(
                                "Re-enter Password",
                                confirmpasswordController,
                                screenWidth,
                                screenHeight),
                            Container(
                              width: screenWidth,
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(
                                  bottom: screenHeight * 0.020,
                                  left: screenWidth * 0.070,
                                  right: screenWidth * 0.053),
                              child: Row(
                                children: [
                                  Radio(
                                      value: "Agree",
                                      groupValue: isterm,
                                      onChanged: (value) {
                                        setState(() {
                                          isterm != "Agree"
                                              ? isterm = "Agree"
                                              : isterm = "Disagree";
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
                                        decorationColor: Colors.black,
                                        decorationThickness: 2,
                                        decorationStyle:
                                            TextDecorationStyle.solid,
                                        fontWeight: FontWeight.normal,
                                        height: 1),
                                  ),
                                ],
                              ),
                            ),
                            _buildSignInButton(screenWidth, screenHeight),
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
                                    text: 'Already have an account? ',
                                  ),
                                  TextSpan(
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Login())),
                                    text: 'Log In',
                                    style: const TextStyle(
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )))),
    );
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
                obscureText: text == "Password"
                    ? isPasswordVisible.value
                    : isConfirmPasswordVisible.value,
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
                  text == "Password"
                      ? isPasswordVisible.value = !isPasswordVisible.value
                      : isConfirmPasswordVisible.value =
                          !isConfirmPasswordVisible.value;
                });
              },
              color: const Color.fromRGBO(171, 171, 171, 1),
              iconSize: 30,
              icon: Icon((text == "Password"
                      ? isPasswordVisible.value
                      : isConfirmPasswordVisible.value)
                  ? Icons.visibility_off_outlined
                  : Icons.visibility),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSignInButton(double width, double height) {
    return GestureDetector(
        onTap: () {
          if (LoginServices().validateName(context, nameController.text) &&
              LoginServices().validateEmail(context, emailController.text) &&
              LoginServices().validatePassword(context, passwordController.text,
                  confirmpasswordController.text)) {
            FirebaseServces().signup(nameController.text, emailController.text,
                passwordController.text, context);
          }
        },
        child: UIHelpers().buildLoginButton("Sing Up", width, height));
  }
}
