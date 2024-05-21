import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:path_provider/path_provider.dart';
import 'package:post_bet/core/Assets/Assets.dart';
import 'package:post_bet/features/home/data/post_repo.dart';

part 'add_post_state.dart';

class AddPostCubit extends Cubit<AddPostState> {
  AddPostCubit(this.postReposatory) : super(AddPostInitial());

  final PostReposatory postReposatory;
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
    emit(LoadingPickImage());
    final result = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (result != null) {
      final file = File(result.path);
      final imageBytes = await watermarkImage(file);
      if (imageBytes != null) {
        image = imageBytes;
        print(imageBytes);

        // store unit8List image here ;

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

  File? displayVideo;
  String? base64String;
  XFile? fileVideo;
  Uint8List? videoBytes;
  Future<void> pickCameraVideo() async {
    final video = await ImagePicker().pickVideo(source: ImageSource.gallery);
    if (video != null) {
      fileVideo = video;
      displayVideo = File(fileVideo!.path);
      videoBytes = File(fileVideo!.path).readAsBytesSync();
      base64String = base64Encode(videoBytes!);
      print(base64String);
      print('yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy ${fileVideo!.path}');
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

  final List<String> selectedaceInstaItems = [];

  final Map<String, bool> checkBoxValues = {};
  final List<String> platformNames = [
    'Instagram',
    'Facebook',
    'Twitter',
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
  String imgUrl = '';
  Future<String> uploadImage(String filePath) async {
    try {
      emit(UploadImageLoading());

      final response = await postReposatory.uploadFile(filePath);
      print('aaaaaaaaaaaaaaaaaaaaaaaaaaaa$response');
      imgUrl = response;
      print('لالالالالالالالالالالالالالالالالالالالالالالالالالالا$imgUrl');
      emit(UploadVideoSuccessfully());
      createImagePost();
      return response;
    } catch (e) {
      print(e.toString());
      emit(UploadImgFailure(errMessage: e.toString()));
      return e.toString();
    }
  }

  String? videoUrl;
  uploadVideo() async {
    emit(UploadVideoLoading());

    final response = await postReposatory.getUploadUrl(fileVideo!.path);

    response.fold((l) {
      emit(UploadVideoFailure(errMessage: l));
      print(l);
    }, (upload) {
      videoUrl = upload;
      emit(UploadImgSuccessfully());
      //verifyVideo();
      createVideoPost();
    });
  }

  verifyVideo() async {
    emit(VerifyVideoLoading());

    final response = await postReposatory.verifyUrl();

    response.fold((l) {
      print(l.toString());
      emit(VerifyVideoFailure(errMessage: l));
      print(l);
    }, (verify) {
      emit(VerifyVideoSuccessfully());
      createVideoPost();
    });
  }

  String? uploasedImg;
  Future convertUint8listToFile() async {
    final tempDir = await getTemporaryDirectory();
    File file = await File('${tempDir.path}/image.png').create();
    file.writeAsBytes(image!).then((value) async {
      uploasedImg = value.path;
      print('yarrrrrrrrrrrrrrrb value.path ${uploasedImg}');
      await uploadImage(value.path).then((value) async {
        //await createPost(imageUrl: imgUrl);
      });
      // await createPost();
    });
  }

  createImagePost() async {
    try {
      emit(CreatePostLoading());

      final response = await postReposatory.createPost(
          addPostController.text, selectedItems, imgUrl);
      print(response);
      emit(CreatePostSuccessfully());
      return response;
    } catch (e) {
      print(e.toString());
      emit(CreatePostFailure(errMessage: e.toString()));

      return e.toString();
    }
  }

  createVideoPost() async {
    try {
      emit(CreatePostLoading());

      final response = await postReposatory.createVideoPost(
        addPostController.text,
        selectedItems,
      );
      print(response);
      emit(CreatePostSuccessfully());
      return response;
    } catch (e) {
      print(e.toString());
      emit(CreatePostFailure(errMessage: e.toString()));
      return e.toString();
    }
  }

  createTextPost() async {
    try {
      emit(CreatePostLoading());

      final response = await postReposatory.createPost(
          addPostController.text, selectedItems, '');
      print(response);
      emit(CreatePostSuccessfully());
      return response;
    } catch (e) {
      print(e.toString());
      emit(CreatePostFailure(errMessage: e.toString()));
      return e.toString();
    }
  }

  void clearpostContant() {
    fileVideo = null;
    image = null;
    displayVideo = null;

    emit(RemovePostContant());
  }
}
     // img.compositeImage(image, banner!, dstH: 35, dstW: 140, dstX: x, dstY: y);
