// import 'dart:io';
// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../../../../constants.dart';
// import 'package:image_editor_plus/image_editor_plus.dart';

// class CustomViewPhotoFromDevice extends StatelessWidget {
//   const CustomViewPhotoFromDevice({
//     super.key,
//     required this.file,
//     required this.function,
//   });
//   final dynamic file;
//   final Function() function;

//   Future<Uint8List> _convertFileToUint8List(File file) async {
//     return await file.readAsBytes();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 1),
//       child: Stack(
//         alignment: AlignmentDirectional.topEnd,
//         children: [
//           Container(
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height * 0.3,
//             decoration: BoxDecoration(
//                 image: DecorationImage(
//                     fit: BoxFit.cover, image: _buildImageProvider()),
//                 borderRadius: const BorderRadius.all(Radius.circular(2))),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               CircleAvatar(
//                 backgroundColor: Colors.white,
//                 radius: 15,
//                 child: IconButton(
//                   onPressed: () async {
//                     if (file is File) {
//                       Uint8List imageData =
//                           await _convertFileToUint8List(file as File);
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => ImageEditor(
//                             savePath: file.path,
//                             image:
//                                 imageData, // Pass the Uint8List to ImageEditor
//                           ),
//                         ),
//                       );
//                     } else if (file is Uint8List) {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => ImageEditor(
//                             image: file, // Pass the Uint8List to ImageEditor
//                           ),
//                         ),
//                       );
//                     }
//                   },
//                   icon: const Icon(
//                     Icons.edit,
//                     color: kPrimaryKey,
//                     size: 13,
//                   ),
//                 ),
//               ),
//               SizedBox(width: 15.w),
//               CircleAvatar(
//                 backgroundColor: Colors.white,
//                 radius: 15,
//                 child: IconButton(
//                   onPressed: function,
//                   icon: const Icon(
//                     Icons.close,
//                     color: kPrimaryKey,
//                     size: 13,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   ImageProvider _buildImageProvider() {
//     if (file is Uint8List) {
//       return MemoryImage(file as Uint8List);
//     } else if (file is File) {
//       return FileImage(file as File);
//     } else if (file is String) {
//       return NetworkImage(file as String);
//     } else {
//       throw ArgumentError('Invalid file type');
//     }
//   }
// }
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../constants.dart';
import 'package:image_editor_plus/image_editor_plus.dart';

class CustomViewPhotoFromDevice extends StatefulWidget {
  const CustomViewPhotoFromDevice({
    super.key,
    required this.file,
    required this.function,
  });
  final dynamic file;
  final Function() function;

  @override
  _CustomViewPhotoFromDeviceState createState() =>
      _CustomViewPhotoFromDeviceState();
}

class _CustomViewPhotoFromDeviceState extends State<CustomViewPhotoFromDevice> {
  dynamic _file;

  @override
  void initState() {
    super.initState();
    _file = widget.file;
  }

  Future<Uint8List> _convertFileToUint8List(File file) async {
    return await file.readAsBytes();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1),
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: _buildImageProvider()),
                borderRadius: const BorderRadius.all(Radius.circular(2))),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 15,
                child: IconButton(
                  onPressed: () async {
                    Uint8List imageData;
                    if (_file is File) {
                      imageData = await _convertFileToUint8List(_file as File);
                    } else if (_file is Uint8List) {
                      imageData = _file as Uint8List;
                    } else {
                      return;
                    }
                    final editedImage = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ImageEditor(
                          image: imageData, // Pass the Uint8List to ImageEditor
                        ),
                      ),
                    );
                    if (editedImage != null) {
                      setState(() {
                        _file = editedImage;
                      });
                    }
                  },
                  icon: const Icon(
                    Icons.edit,
                    color: kPrimaryKey,
                    size: 13,
                  ),
                ),
              ),
              SizedBox(width: 15.w),
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 15,
                child: IconButton(
                  onPressed: widget.function,
                  icon: const Icon(
                    Icons.close,
                    color: kPrimaryKey,
                    size: 13,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  ImageProvider _buildImageProvider() {
    if (_file is Uint8List) {
      return MemoryImage(_file as Uint8List);
    } else if (_file is File) {
      return FileImage(_file as File);
    } else if (_file is String) {
      return NetworkImage(_file as String);
    } else {
      throw ArgumentError('Invalid file type');
    }
  }
}
