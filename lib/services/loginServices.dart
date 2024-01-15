import 'package:flutter/material.dart';

class LoginServices {
  bool validateEmail(BuildContext context, String email) {
    String pattern = r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$';
    RegExp regExp = RegExp(pattern);
    if (email == '') {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Please enter email')));
      return false;
    } else if (!regExp.hasMatch(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter valid email'),
        ),
      );
      return false;
    } else {
      return true;
    }
  }

  // bool validatePassword(BuildContext context, String password) {
  //   if (password.length < 8) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(
  //         content: Text('Password must be at least 8 characters long'),
  //       ),
  //     );
  //     return false;
  //   } else if (password == '') {
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(const SnackBar(content: Text('Please enter email')));
  //     return false;
  //   } else {
  //     return true;
  //   }
  // }

  bool validateName(BuildContext context, String name) {
    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Please enter your name'),
      ));
      return false;
    }
    return true;
  }

   bool validatePassword(
      BuildContext context, String password, String confirmPassword) {
    if (password.length < 8) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password must be at least 8 characters long'),
        ),
      );
      return false;
    } else if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Passwords do not match'),
        ),
      );
      return false;
    } else if (password == '') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a password')),
      );
      return false;
    } else {
      return true;
    }
  }

}