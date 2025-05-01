import 'package:facedetection/view/face_detection.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static String id = "splashscreen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, FaceDetection.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,  
        height: MediaQuery.of(context).size.height, 
        child: Lottie.asset(
          "assets/images/Animation - 1740446872241.json",
          fit: BoxFit.fill, 
        ),
      ),
    );
  }
}
