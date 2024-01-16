import 'package:myopia/background2.dart';
import 'package:myopia/firebase_options.dart';
import 'package:myopia/login.dart';
import 'package:myopia/loginpage.dart';
import 'package:myopia/questionnaire.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myopia/questionnaire1.dart';
import 'package:myopia/report.dart';
import 'package:myopia/signup.dart';

void main()async {
    WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
   );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});  
  
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SignUp(),
   );
  }

  
}

