import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'background.dart';

class Report extends StatefulWidget {
  const Report({super.key});

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  String groupValue = "";
  int selectedDate = 0;
  List text = [
    "Great news! Your risk assessment is low",
    "Your risk assessment is moderate! Let’s take some extra steps.",
    "Your risk assessment is high! It’s important to act quickly."
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

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
                      margin: EdgeInsets.only(
                          top: screenHeight * 0.580,
                          left: screenWidth * 0.100,
                          right: screenWidth * 0.100,
                          bottom: screenHeight * 0.020),
                      padding: EdgeInsets.all(20),
                      child: Text(
                          text[0],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Inter',
                            fontSize: 24,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                            height: 1),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Implement 'Next' button functionality
                      },
                      child: Container(
                        width: screenWidth,
                        height: screenHeight * 0.055,
                        margin: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.100),
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
                            'Book an Appointment',
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
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: screenWidth,
                        height: screenHeight * 0.055,
                        margin: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.100),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color.fromRGBO(246, 246, 246, 1),
                          border: Border.all(
                            color: AppColors.darkblue,
                            width: 1,
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            'Skip',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.darkblue,
                              fontFamily: 'Inter',
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
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
}
