import 'package:facedetection/view/face_detection.dart';
import 'package:facedetection/view/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
  
        useMaterial3: false,
      ),
      routes: {
FaceDetection.id:(context)=>FaceDetection(),
SplashScreen.id:(context)=>SplashScreen()
      },
      initialRoute:SplashScreen.id ,
    );
  }
}
