import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseServces {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<void> addUser(String userId, String username, String email) async {
    await _firestore.collection('users').doc(userId).set({
      'username': username,
      'email': email,
    });
  }

  Future<void> login(
      String email, String password, BuildContext context) async {
    try {
      showLoadingIndicator(context);

      final auth = FirebaseAuth.instance;
      await auth.signInWithEmailAndPassword(email: email, password: password);

      hideLoadingIndicator(context);

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Login Successful.'),
      ));
    } catch (e) {
      print('Login failed: $e');

      hideLoadingIndicator(context);

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Login failed. Please check your credentials.'),
      ));
    }
  }

  Future<void> signup(
      String name, String email, String password, BuildContext context) async {
    try {
      showLoadingIndicator(context);
      final auth = FirebaseAuth.instance;
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);

      hideLoadingIndicator(context);
      User? user = auth.currentUser;

      if (user != null) {
        String userId = user.uid;
        await FirebaseServces().addUser(userId, name, email);
        hideLoadingIndicator(context);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Sign Up Successful.'),
        ));
      }
    } catch (e) {
      print('Login failed: $e');
      hideLoadingIndicator(context);
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Login failed. Please check your credentials.'),
      ));
    }
  }

  void showLoadingIndicator(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  void hideLoadingIndicator(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop();
  }
}
