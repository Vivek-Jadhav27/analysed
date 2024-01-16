import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'app_colors.dart';

class Questionnaire1 extends StatefulWidget {
  const Questionnaire1({super.key});

  @override
  State<Questionnaire1> createState() => _Questionnaire1State();
}

class _Questionnaire1State extends State<Questionnaire1> {
  late int selectedYear;
  late int currentYear;
  double selectednumber = 1.25;
  int usehour = 1;
  int position = 0;
  String gender = "";
  final TextEditingController year1 = TextEditingController();
  final TextEditingController year2 = TextEditingController();
  final TextEditingController year3 = TextEditingController();
  final TextEditingController year4 = TextEditingController();
  final TextEditingController year5 = TextEditingController();
  String retena = "";
  String cornea = "";
  String eyesize = "";

  @override
  void initState() {
    super.initState();
    currentYear = DateTime.now().year;
    selectedYear = currentYear; // set the initial value to the current year
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    List questions = [
      _buildGenders(screenWidth, screenHeight),
      _buildMyopiaSince(screenWidth, screenHeight),
      _buildPresentPower(screenWidth, screenHeight),
      _buildLastYears(screenWidth, screenHeight),
      _buildSpectaclesTime(screenWidth, screenHeight),
      _buildYesNo("Retina (Fundus Examination)", screenWidth, screenHeight),
      _buildYesNo("Cornea (Topo Graphy)", screenWidth, screenHeight),
      _buildYesNo("Eye Ball size", screenWidth, screenHeight),
    ];

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
                gradient: LinearGradient(colors: [
              Color.fromRGBO(15, 164, 220, 1),
              Color.fromRGBO(68, 190, 231, 1)
            ])),
            child: Stack(children: [
              Container(
                width: screenWidth,
                margin: EdgeInsets.only(
                    left: screenWidth * 0.053, top: screenHeight * 0.060),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: screenHeight * 0.05,
                      height: screenHeight * 0.05,
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    const Text(
                      'Application',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Inter',
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 10,
                margin: EdgeInsets.only(
                    left: screenWidth * 0.053,
                    right: screenWidth * 0.053,
                    top: screenHeight * 0.150,
                    bottom: screenHeight * 0.080),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(8, (index) => buildSegment(index)),
                ),
              ),
              Container(
                width: screenWidth,
                height: screenHeight,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                margin: EdgeInsets.only(
                    left: screenWidth * 0.053,
                    right: screenWidth * 0.053,
                    top: screenHeight * 0.180,
                    bottom: screenHeight * 0.080),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    questions[position],
                    _buildButtons(screenWidth, screenHeight),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  Widget buildSegment(int index) {
    return Container(
        width: 60,
        height: 15,
        margin: EdgeInsets.symmetric(horizontal: 8), // Adjust margin as needed
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: index < position + 1
              ? Colors.white
              : AppColors.darkblue // Color for positions 0 to 4
          ,
          border: Border.all(
            color: index < position + 1
                ? AppColors.darkblue // Color for positions 0 to 4
                : Colors.white,
            width: 1,
          ),
        ));
  }

  Widget _buildButtons(double screenWidth, double screenHeight) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.053,
        vertical: screenHeight * 0.05,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                if (position > 0) {
                  position--;
                }
              });
            },
            child: Container(
              width: screenWidth * 0.300,
              height: screenHeight * 0.057,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
                border: Border.all(
                  color: position != 0
                      ? AppColors.darkblue
                      : Color.fromRGBO(171, 171, 171, 1),
                  width: 1,
                ),
              ),
              child: Center(
                child: Text(
                  'Back',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: position != 0
                        ? AppColors.darkblue
                        : Color.fromRGBO(171, 171, 171, 1),
                    fontFamily: 'Inter',
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              // Implement 'Next' button functionality
              setState(() {
                if (position < 7) {
                  position++;
                }
              });
            },
            child: Container(
              width: screenWidth * 0.300,
              height: screenHeight * 0.057,
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
                  position == 7 ? 'Submit' : 'Next',
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
        ],
      ),
    );
  }

  Widget _buildGenders(double screenWidth, double screenHeight) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: screenWidth * 0.070, top: 30),
          child: const Text(
            'Gender',
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              gender = "Male";
            });
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              side: BorderSide(
                color: gender == "Male" ? AppColors.darkblue : Colors.white,
                width: 2,
              ),
            ),
            elevation: 10,
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Container(
              height: screenHeight * 0.115,
              width: double.maxFinite,
              padding: EdgeInsets.all(20),
              child: Container(
                width: double.maxFinite,
                alignment: Alignment.centerLeft,
                child: Text(
                  'Male',
                  style: TextStyle(
                      fontSize: 20,
                      color:
                          gender == "Male" ? AppColors.darkblue : Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              gender = "Female";
            });
          },
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              side: BorderSide(
                color: gender == "Female" ? AppColors.darkblue : Colors.white,
                width: 2,
              ),
            ),
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Container(
              height: screenHeight * 0.115,
              width: double.maxFinite,
              padding: EdgeInsets.all(20),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(40.0)),
              child: Container(
                width: double.maxFinite,
                alignment: Alignment.centerLeft,
                child: Text(
                  'Female',
                  style: TextStyle(
                      fontSize: 20,
                      color: gender == "Female"
                          ? AppColors.darkblue
                          : Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              gender = "Other";
            });
          },
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              side: BorderSide(
                color: gender == "Other" ? AppColors.darkblue : Colors.white,
                width: 2,
              ),
            ),
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Container(
              height: screenHeight * 0.115,
              width: double.maxFinite,
              padding: EdgeInsets.all(20),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(40.0)),
              child: Container(
                width: double.maxFinite,
                alignment: Alignment.centerLeft,
                child: Text(
                  'Other',
                  style: TextStyle(
                      fontSize: 20,
                      color:
                          gender == "Other" ? AppColors.darkblue : Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPresentPower(double screenWidth, double screenHeight) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin:
              EdgeInsets.only(left: screenWidth * 0.070, top: 30, bottom: 20),
          child: Text(
            'Present Myopic Power $selectednumber',
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          elevation: 10,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Container(
            height: screenHeight * 0.220,
            width: double.maxFinite,
            padding: EdgeInsets.all(20),
            child: DecimalNumberPicker(
              minValue: 0,
              maxValue: 2,
              decimalPlaces: 2,
              onChanged: (value) {
                setState(() {
                  selectednumber = value;
                });
              },
              value: selectednumber,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMyopiaSince(double screenWidth, double screenHeight) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin:
              EdgeInsets.only(left: screenWidth * 0.070, top: 30, bottom: 20),
          child: const Text(
            'Myopic since',
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        Card(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          elevation: 10,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Container(
            height: screenHeight * 0.220,
            width: double.maxFinite,
            padding: const EdgeInsets.all(20),
            child: NumberPicker(
              value: selectedYear,
              minValue: 2000,
              maxValue: 2024,
              onChanged: (value) {
                setState(() {
                  selectedYear = value;
                });
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSpectaclesTime(double screenWidth, double screenHeight) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin:
              EdgeInsets.only(left: screenWidth * 0.070, top: 30, bottom: 20),
          child: Text(
            'Spectacles usage time(hrs) $usehour',
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        Card(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          elevation: 10,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Container(
            height: screenHeight * 0.220,
            width: double.maxFinite,
            padding: const EdgeInsets.all(20),
            child: NumberPicker(
              value: usehour,
              minValue: 0,
              maxValue: 15,
              onChanged: (value) {
                setState(() {
                  usehour = value;
                });
              },
            ),
          ),
        ),
      ],
    );
  }

  // Widget _buildYesNo(String text, double screenWidth, double screenHeight) {
  //   String selected = "";
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Container(
  //         margin: EdgeInsets.only(left: screenWidth * 0.070, top: 30),
  //         child: Text(
  //           text,
  //           style: TextStyle(
  //               fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
  //         ),
  //       ),
  //       GestureDetector(
  //         onTap: () {
  //           switch (position) {
  //             case 5:
  //             setState(() {
  //               retena = selected = "Yes";
  //             });
  //               break;
  //             case 6:
  //             setState(() {
  //               cornea = selected ="Yes";
  //             });
  //               break;
  //             case 7:
  //             setState(() {
  //               eyesize =selected = "Yes";
  //             });
  //               break;
  //             default:
  //           }
  //         },
  //         child: Card(
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.all(Radius.circular(20)),
  //             side: BorderSide(
  //               color: selected == "Yes" ?AppColors.darkblue : Colors.white,
  //               width: 2,
  //             ),
  //           ),
  //           elevation: 10,
  //           margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  //           child: Container(
  //             height: screenHeight * 0.115,
  //             width: double.maxFinite,
  //             padding: EdgeInsets.all(20),
  //             child: Container(
  //               width: double.maxFinite,
  //               alignment: Alignment.centerLeft,
  //               child: Text(
  //                 'Yes',
  //                 style: TextStyle(
  //                     fontSize: 20,
  //                     color:selected == "Yes" ?AppColors.darkblue : Colors.black,
  //                     fontWeight: FontWeight.bold),
  //               ),
  //             ),
  //           ),
  //         ),
  //       ),
  //       GestureDetector(
  //         onTap: () {
  //           switch (position) {
  //             case 5:
  //             setState(() {
  //               retena = selected = "No";
  //             });
  //               break;
  //             case 6:
  //             setState(() {
  //               cornea = selected ="No";
  //             });
  //               break;
  //             case 7:
  //             setState(() {
  //               eyesize =selected = "No";
  //             });
  //               break;
  //             default:
  //           }
  //         },
  //         child: Card(
  //           elevation: 10,
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.all(Radius.circular(20)),
  //             side: BorderSide(
  //               color: selected == "No" ?AppColors.darkblue : Colors.white,
  //               width: 2,
  //             ),
  //           ),
  //           margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  //           child: Container(
  //             height: screenHeight * 0.115,
  //             width: double.maxFinite,
  //             padding: EdgeInsets.all(20),
  //             decoration:
  //                 BoxDecoration(borderRadius: BorderRadius.circular(40.0)),
  //             child: Container(
  //               width: double.maxFinite,
  //               alignment: Alignment.centerLeft,
  //               child: Text(
  //                 'No',
  //                 style: TextStyle(
  //                     fontSize: 20,
  //                     color: selected == "No" ?AppColors.darkblue : Colors.black,
  //                     fontWeight: FontWeight.bold),
  //               ),
  //             ),
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  Widget _buildYesNo(String text, double screenWidth, double screenHeight) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(left: screenWidth * 0.070, top: 30),
          child: Text(
            text,
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        _buildOptionButton("Yes", text, screenWidth, screenHeight),
        _buildOptionButton("No", text, screenWidth, screenHeight),
      ],
    );
  }

  Widget _buildOptionButton(
      String option, String question, double screenWidth, double screenHeight) {
    return GestureDetector(
      onTap: () {
        setState(() {
          switch (question) {
            case "Retina (Fundus Examination)":
              retena = option;
              break;
            case "Cornea (Topo Graphy)":
              cornea = option;
              break;
            case "Eye Ball size":
              eyesize = option;
              break;
          }
        });
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          side: BorderSide(
            color: _getBorderColor(question, option),
            width: 2,
          ),
        ),
        elevation: 10,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Container(
          height: screenHeight * 0.115,
          width: double.maxFinite,
          padding: EdgeInsets.all(20),
          child: Container(
            width: double.maxFinite,
            alignment: Alignment.centerLeft,
            child: Text(
              option,
              style: TextStyle(
                fontSize: 20,
                color: _getTextColor(question, option),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color _getBorderColor(String question, String option) {
    return _getOptionValue(question) == option
        ? AppColors.darkblue
        : Colors.white;
  }

  Color _getTextColor(String question, String option) {
    return _getBorderColor(question, option) == AppColors.darkblue
        ? AppColors.darkblue
        : Colors.black;
  }

  String _getOptionValue(String question) {
    switch (question) {
      case "Retina (Fundus Examination)":
        return retena;
      case "Cornea (Topo Graphy)":
        return cornea;
      case "Eye Ball size":
        return eyesize;
      default:
        return "";
    }
  }

  Widget _buildLastYears(double screenWidth, double screenHeight) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin:
              EdgeInsets.only(left: screenWidth * 0.070, top: 30, bottom: 20),
          child: Text(
            'Last 5 year Readings',
            style: TextStyle(
                fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          elevation: 10,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  TextField(
                    controller: year1,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      hintText: 'Year 1',
                      hintStyle: TextStyle(fontFamily: "Inter"),
                    ),
                  ),
                  TextField(
                    controller: year2,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      hintText: 'Year 2',
                      hintStyle: TextStyle(fontFamily: "Inter"),
                    ),
                  ),
                  TextField(
                    controller: year3,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      hintText: 'Year 3',
                      hintStyle: TextStyle(fontFamily: "Inter"),
                    ),
                  ),
                  TextField(
                    controller: year4,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      hintText: 'Year 4',
                      hintStyle: TextStyle(fontFamily: "Inter"),
                    ),
                  ),
                  TextField(
                    controller: year5,
                    textAlign: TextAlign.start,
                    decoration: InputDecoration(
                      hintText: 'Year 5',
                      hintStyle: TextStyle(fontFamily: "Inter"),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  )
                ],
              )),
        ),
      ],
    );
  }
}
