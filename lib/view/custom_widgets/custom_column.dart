import 'dart:io';

import 'package:facedetection/view/custom_widgets/cutom_inkwell.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:image_picker/image_picker.dart';

class CustomColumnBody extends StatefulWidget {
  const CustomColumnBody({super.key});

  @override
  State<CustomColumnBody> createState() => _CustomColumnBodyState();
}

class _CustomColumnBodyState extends State<CustomColumnBody> {
  File? _image;
  List<Face> faces = [];

  Future<void> _detectFaces(File img) async {
    final options = FaceDetectorOptions();
    final faceDetector = FaceDetector(options: options);
    try {
      final inputImage = InputImage.fromFile(img);
      faces = await faceDetector.processImage(inputImage);
      setState(() {});
    } finally {
      faceDetector.close();
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      setState(() {
        _image = File(image.path);
      });
      await _detectFaces(_image!);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width; 
    double screenHeight = MediaQuery.of(context).size.height; 

    return Column(
      children: [
        Container(
          height: screenHeight * 0.3, 
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 196, 69, 124),
            borderRadius: BorderRadius.circular(12),
          ),
          child: _image == null
              ? const Icon(
                  Icons.add_a_photo,
                  size: 60,
                  color: Colors.white,
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.file(
                    _image!,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
        ),
        SizedBox(height: screenHeight * 0.05),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: CustomInkWell(
                text: "Upload a Photo",
                onTap: () {
                  setState(() {
                    _image = null;
                  });
                  _pickImage(ImageSource.gallery);
                },
              ),
            ),
            SizedBox(width: screenWidth * 0.03),
            Expanded(
              child: CustomInkWell(
                text: "Take a Photo",
                onTap: () {
                  setState(() {
                    _image = null;
                  });
                  _pickImage(ImageSource.camera);
                },
              ),
            ),
          ],
        ),
        SizedBox(height: screenHeight * 0.03),

        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          color: const Color(0xff99CAD9),
          elevation: 10,
          child: Padding(
            padding: EdgeInsets.all(screenWidth * 0.04),
            child: Text(
              "Faces Detected: ${_image == null ? 0 : faces.length}",
              style: TextStyle(
                fontSize: screenWidth * 0.06,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }

}
