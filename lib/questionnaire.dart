import 'package:myopia/background.dart';
import 'package:flutter/material.dart';
import 'app_colors.dart';

class Questionnaire extends StatefulWidget {
  const Questionnaire({super.key});

  @override
  State<Questionnaire> createState() => _QuestionnaireState();
}

class _QuestionnaireState extends State<Questionnaire> {
  String groupValue = "";
  int selectedDate = 0;
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
            decoration: const  BoxDecoration(
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
                          left: screenWidth * 0.053,
                          right: screenWidth * 0.053,
                          bottom: screenHeight*0.020),
                          padding: EdgeInsets.all(20),
                      child: const Text(
                        'Please participate in the given questionnaire to let us understand your needs in a better manner.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Inter',
                            fontSize: 20,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                            height: 1),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: screenWidth * 0.053,
                        right: screenWidth*0.053,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              // Implement 'Next' button functionality
                            },
                            child: Container(
                              width: screenWidth * 0.300,
                              height: screenHeight * 0.055,
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
                                  'Start',
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
                          const SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: screenWidth * 0.300,
                              height: screenHeight * 0.055,
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
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
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
