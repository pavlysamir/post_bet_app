import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomViewPostPhoto extends StatelessWidget {
  const CustomViewPostPhoto({
    super.key,
    required this.file,
  });
  final dynamic file;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.2,
        height: MediaQuery.of(context).size.height * 0.13,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fitHeight, image: _buildImageProvider()),
            // border: Border.all(color: kPrimaryKey),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
      ),
    );
  }

  ImageProvider _buildImageProvider() {
    if (file is Uint8List) {
      // If 'file' is a Uint8List (watermarked image data), use MemoryImage
      return MemoryImage(file as Uint8List);
    } else if (file is File) {
      // If 'file' is still a File (original image), use FileImage
      return FileImage(file as File);
    } else if (file is String) {
      // If 'file' is a String (URL), use NetworkImage
      return NetworkImage(file as String);
    } else {
      // Handle other cases or throw an error
      throw ArgumentError('Invalid file type');
    }
  }
}
