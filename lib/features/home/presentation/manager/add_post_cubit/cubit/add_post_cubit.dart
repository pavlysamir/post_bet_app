import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart' as services;
import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:post_bet/core/Assets/Assets.dart';

part 'add_post_state.dart';

class AddPostCubit extends Cubit<AddPostState> {
  AddPostCubit() : super(AddPostInitial());
  static AddPostCubit get(BuildContext context) => BlocProvider.of(context);

  TextEditingController addPostController = TextEditingController();

  // File? fileImage;
  // Future<void> pickCameraImage() async {
  //   final image = await ImagePicker().pickImage(source: ImageSource.gallery);
  //   if (image != null) {
  //     fileImage = File(image.path);
  //     watermarkImage(fileImage!, AssetsData.faceBookIcon);
  //     emit(SuccessfulPickImage());
  //   } else {
  //     emit(FailPickImage());
  //     return;
  //   }
  // }
  Uint8List? image;
  Future<void> pickImage() async {
    final result = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (result != null) {
      final file = File(result.path);
      final imageBytes = await watermarkImage(file);
      if (imageBytes != null) {
        image = imageBytes;
        // Emit state or update bloc (if using state management)
        emit(SuccessfulPickImage());
      } else {
        // Emit state or update bloc with error (if using state management)
        emit(FailPickImage());
      }
    } else {
      // Emit state or update bloc with cancel message (if using state management)
      return;
    }
  }

  File? fileVideo;
  Future<void> pickCameraVideo() async {
    final video = await ImagePicker().pickVideo(source: ImageSource.gallery);
    if (video != null) {
      fileVideo = File(video.path);
      print(fileVideo.toString());
      emit(SuccessfulPickImage());
    } else {
      emit(FailPickImage());
      return;
    }
  }

  void clearImage() {
    image = null;
    emit(RemoveFileImage());
  }

  void clearVideo() {
    fileVideo = null;
    emit(RemoveFileVideo());
  }

  Future<Uint8List?> watermarkImage(File imageFile) async {
    final img.Image? image =
        await img.decodeImage(await imageFile.readAsBytes());
    if (image != null) {
      const String logoPath =
          'assets/images/logo.png'; // Replace with your logo path
      // final img.Image? logo =
      //     await img.decodeImage(await File(logoPath).readAsBytes());

      final img.Image? logo =
          await img.decodeImage(await loadAssetAsBytes(logoPath));

      // Adjust watermark position and size based on your requirements
      final int logoWidth = logo!.width;
      final int logoHeight = logo.height;
      final int x = image.width - (5 * logoWidth);
      final int y = image.height - 60;

      // Composite the logo onto the image (adjust blending mode as needed)
      img.compositeImage(image, logo, dstH: 35, dstW: 200, dstX: x, dstY: y);

      // Convert the watermarked image to a byte array
      final pngBytes = img.encodePng(image);
      return pngBytes;
    }
    return null;
  }

  Future<Uint8List> loadAssetAsBytes(String assetPath) async {
    try {
      final bytes = await rootBundle.load(assetPath);
      return bytes.buffer.asUint8List();
    } catch (e) {
      print('Error loading asset: $e');
      return Uint8List(0); // Handle error gracefully
    }
  }

  final List<String> selectedItems = [];

  final Map<String, bool> checkBoxValues = {};
  final List<String> platformNames = [
    'Instagram',
    'Facebook',
    'X',
    'Linkedin',
    'Reddit',
    'Youtube',
    'Tiktok',
    'Pinterest',
    'Telegram',
    'Google Business'
  ];
  final List<String> platformIcons = [
    AssetsData.instagramIcon,
    AssetsData.faceBookIcon,
    AssetsData.xIcon,
    AssetsData.linkedln,
    AssetsData.reddit,
    AssetsData.youtube,
    AssetsData.tiktok,
    AssetsData.pinterest,
    AssetsData.telegram,
    AssetsData.googleBusiness
  ];
}
     // img.compositeImage(image, banner!, dstH: 35, dstW: 140, dstX: x, dstY: y);
