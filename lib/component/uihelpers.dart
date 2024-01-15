import 'package:flutter/material.dart';
import 'app_colors.dart';
import '../screens/login.dart';
import '../screens/signup.dart';

class UIHelpers {
  Widget buildLoginPageButton(
      String text, double width, double height, BuildContext context) {
    Color textColor = text == "Log In"
        ? AppColors.darkblue
        : const Color.fromRGBO(246, 246, 246, 1);
    Color boxColor = text == "Log In"
        ? const Color.fromRGBO(246, 246, 246, 1)
        : AppColors.darkblue;
    Widget widget = text == "Log In" ? const Login() : const SignUp();
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => widget));
      },
      child: Container(
        width: width,
        height: height * 0.057,
        margin: EdgeInsets.only(left: width * 0.053, right: width * 0.053),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: boxColor,
          border: Border.all(
            color: AppColors.darkblue,
            width: 1,
          ),
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColor,
              fontFamily: 'Inter',
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildInputTextField(String text, TextEditingController controller,
      double width, double height) {
    return Container(
      width: width,
      height: height * 0.057,
      margin: EdgeInsets.only(
          bottom: height * 0.010, left: width * 0.053, right: width * 0.053),
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
          controller: controller,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 20),
            hintText: text,
            hintStyle: TextStyle(fontFamily: "Inter"),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Widget buildLoginButton(String text,double width, double height) {
    return Container(
      width: width * 0.350,
      height: height * 0.057,
      margin: EdgeInsets.only(
           left: width * 0.053, right: width * 0.053),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: AppColors.darkblue,
        border: Border.all(
          color: AppColors.darkblue,
          width: 1,
        ),
      ),
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Inter',
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
