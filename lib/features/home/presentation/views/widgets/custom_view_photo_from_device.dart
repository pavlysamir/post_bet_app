import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../../constants.dart';

class CustomViewPhotoFromDevice extends StatelessWidget {
  const CustomViewPhotoFromDevice({
    super.key,
    required this.file,
    required this.function,
  });
  final dynamic file;
  final Function() function;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.2,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fitHeight, image: _buildImageProvider()),
                // border: Border.all(color: kPrimaryKey),
                borderRadius: const BorderRadius.all(Radius.circular(10))),
          ),
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 15,
            child: IconButton(
              onPressed: function,
              icon: const Icon(
                Icons.close,
                color: kPrimaryKey,
                size: 13,
              ),
            ),
          )
        ],
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
