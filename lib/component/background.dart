import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;
import 'app_colors.dart';

class Background extends StatelessWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: <Widget>[
        
        //Lower White Widget
        Positioned(
          top: screenHeight * 0.480,
          left: -screenWidth * 0.130,
          child: Transform.rotate(
            angle: 19.47 * (math.pi / 180),
            child: Container(
              width: screenWidth * 1.500,
              height: screenHeight * 0.750,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(57),
                color: const Color.fromRGBO(246, 246, 246, 1),
              ),
            ),
          ),
        ),

        //Right Lower Blue Widget
        Positioned(
          top: -screenHeight * 0.260,
          left: screenWidth * 0.460,
          child: Transform.rotate(
            angle: 19.47 * (math.pi / 180),
            child: Container(
              width: screenWidth * 1.500,
              height: screenHeight * 0.750,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(57),
                color: const Color.fromRGBO(24, 174, 224, 1),
              ),
            ),
          ),
        ),

        //Right Upper Blue Widget
        Positioned(
          top: -screenHeight * 0.280,
          right: -screenWidth * 1.05,
          child: Transform.rotate(
            angle: 19.47 * (math.pi / 180),
            child: Container(
              width: screenWidth * 1.3,
              height: screenHeight * 0.750,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(57),
                color: AppColors.lightblue,
              ),
            ),
          ),
        ),

        //Left Blue Widget
        Positioned(
          top: screenHeight * 0.150,
          left: -screenWidth * 1.35,
          child: Transform.rotate(
            angle: 19.47 * (math.pi / 180),
            child: Container(
              width: screenWidth * 1.3,
              height: screenHeight * 0.750,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(57),
                color: AppColors.lightblue,
              ),
            ),
          ),
        ),

        //Application
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: screenHeight * 0.15, bottom: 10.0),
                width: screenHeight * 0.12,
                height: screenHeight * 0.12,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              Text(
                'Application',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  height: 1,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
