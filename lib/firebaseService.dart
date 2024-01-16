import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseServices {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addUser(String userId, String username, String email) async {
    await _firestore.collection('users').doc(userId).set({
      'username': username,
      'email': email,
    });
  }
}