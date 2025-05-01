import 'package:facedetection/view/custom_widgets/custom_app_bar.dart';
import 'package:facedetection/view/custom_widgets/custom_column.dart';
import 'package:flutter/material.dart';

class FaceDetection extends StatelessWidget {
  const FaceDetection({super.key});
  static String id = "facedetection";

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;  // عرض الشاشة
    double screenHeight = MediaQuery.of(context).size.height; // ارتفاع الشاشة

    return Scaffold(
      backgroundColor: Color(0xffDDD8D5),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight * 0.08), // جعل ارتفاع الـ AppBar نسبيًا
        child: CustomAppBar(title: "Face Detection"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: screenHeight * 0.03, // يجعل المسافات النسبية وفقًا لحجم الشاشة
          horizontal: screenWidth * 0.03,
        ),
        child: CustomColumnBody(),
      ),
    );
  }
}
