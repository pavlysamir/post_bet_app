import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
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
  List<File> postImages = [];
  File? imageFile;
  Future<void> pickImage() async {
    emit(LoadingPickImage());
    final result = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (result != null) {
      postImages.add(File(result.path));
      if (kDebugMode) {
        print(postImages.length);
        print('imaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaage${File(result.path).path}');
      }
      //imageFile = result;
      final file = File(result.path);
      imageFile = file;
      print('imaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaage${imageFile!.path}');

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

  List<File> postVideos = [];
  File? displayVideo;
  String? base64String;
  XFile? fileVideo;
  Uint8List? videoBytes;
  Future<void> pickCameraVideo() async {
    final video = await ImagePicker().pickVideo(source: ImageSource.gallery);
    if (video != null) {
      postVideos.add(File(video.path));
      if (kDebugMode) {
        print(postVideos.length);
      }
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
    postImages.clear();
    emit(RemoveFileImage());
  }

  void clearVideo() {
    fileVideo = null;
    emit(RemoveFileVideo());
  }

  void removePostImageFromDevice(int numOfImg) {
    if (numOfImg == 1) {
      // postImage1 = null;
      postImages.removeAt(0);
      if (kDebugMode) {
        print(postImages.length);
      }
      emit(RemovePostImagePickedState());
    } else if (numOfImg == 2) {
      //postImage2 = null;
      postImages.removeAt(1);
      if (kDebugMode) {
        print(postImages.length);
      }

      emit(RemovePostImagePickedState());
    } else if (numOfImg == 3) {
      //postImage3 = null;
      postImages.removeAt(2);
      if (kDebugMode) {
        print(postImages.length);
      }

      emit(RemovePostImagePickedState());
    }
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
    'Facebook Pages',
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

  List<String> imagesUrls = [];
  String? imgUrl;
  uploadImage() async {
    try {
      emit(UploadImageLoading());
      final upload = postImages.map((image) async {
        await postReposatory.uploadFile(image.path).then((value) {
          imagesUrls.add(value);
          print('ccccccccccccccccccccccccccccccc${value}');
        });
      }).toList();
      print(
          'لالالالالالالالالالالالالالالالالالالالالالالالالالالا$imagesUrls');
      emit(UploadImgSuccessfully());
      Future.wait(upload).then((value) {
        createImagePost();
      });
      // final response = await postReposatory.uploadFile(filePath);
      // print('aaaaaaaaaaaaaaaaaaaaaaaaaaaa$response');
      // imgUrl = response;
    } catch (e) {
      print(e.toString());
      emit(UploadImgFailure(errMessage: e.toString()));
    }
  }

  String? videoUrl;
  uploadVideo() async {
    try {
      emit(UploadVideoLoading());

      final response = await postReposatory.uploadFile(fileVideo!.path);

      print('aaaaaaaaaaaaaaaaaaaaaaaaaaaa$response');
      videoUrl = response;
      print('لالالالالالالالالالالالالالالالالالالالالالالالالالالا$videoUrl');
      emit(UploadVideoSuccessfully());
      createVideoPost();
      return response;
    } catch (e) {
      print(e.toString());
      emit(UploadVideoFailure(errMessage: e.toString()));
      return e.toString();
    }
  }

  String? videoreelUrl;
  uploadReelVideo() async {
    try {
      emit(UploadFaceBookReelLoading());

      final response = await postReposatory.uploadFile(fileVideo!.path);

      print('aaaaaaaaaaaaaaaaaaaaaaaaaaaa$response');
      videoreelUrl = response;
      print('لkokokokokokokokokokokokoko$videoreelUrl');
      emit(UploadFaceBookReelSuccessfully());
      createFaceBookReel();
      return response;
    } catch (e) {
      print(e.toString());
      emit(UploadFaceBookReelFailure(errMessage: e.toString()));
      return e.toString();
    }
  }

  String? imgStoryUrl;
  uploadImageStory() async {
    try {
      emit(UploadFaceBookImageStoryLoading());

      final response = await postReposatory.uploadFile(imageFile!.path);

      print('aaaaaaaaaaaaaaaaaaaaaaaaaaaa$response');
      imgStoryUrl = response;
      print('لkokokokokokokokokokokokoko$imgStoryUrl');
      emit(UploadFaceBookImageStorySuccessfully());
      createFaceBookImageSrory();
      return response;
    } catch (e) {
      print(e.toString());
      emit(UploadFaceBookImageStoryFailure(errMessage: e.toString()));
      return e.toString();
    }
  }

  // verifyVideo() async {
  //   emit(VerifyVideoLoading());

  //   final response = await postReposatory.verifyUrl();

  //   response.fold((l) {
  //     print(l.toString());
  //     emit(VerifyVideoFailure(errMessage: l));
  //     print(l);
  //   }, (verify) {
  //     emit(VerifyVideoSuccessfully());
  //     createVideoPost();
  //   });
  // }

  String? uploasedImg;
  Future convertUint8listToFile() async {
    final tempDir = await getTemporaryDirectory();
    File file = await File('${tempDir.path}/image.png').create();
    file.writeAsBytes(image!).then((value) async {
      uploasedImg = value.path;
      print('yarrrrrrrrrrrrrrrb value.path ${uploasedImg}');
      // await uploadImage(value.path).then((value) async {
      //await createPost(imageUrl: imgUrl);
      //  });
      // await createPost();
    });
  }

  String? uploasedStoryImg;
  Future convertUint8listToFileFaceStory() async {
    final tempDir = await getTemporaryDirectory();
    File file = await File('${tempDir.path}/image.png').create();
    file.writeAsBytes(image!).then((value) async {
      uploasedStoryImg = value.path;
      print('yarrrrrrrrrrrrrrrb value.path ${uploasedImg}');
      // await uploadImage(value.path).then((value) async {
      //   //await createPost(imageUrl: imgUrl);
      // });
      // await createPost();
    });
  }

  createImagePost() async {
    try {
      emit(CreatePostLoading());

      final response = await postReposatory.createPost(
          addPostController.text, selectedItems, imagesUrls);
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

      final response = await postReposatory.createTextPost(
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

  createVideoPost() async {
    try {
      emit(CreatePostLoading());

      final response = await postReposatory.createVideoPost(
        addPostController.text,
        selectedItems,
        videoUrl!,
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

  void clearpostContant() {
    fileVideo = null;
    image = null;
    displayVideo = null;

    emit(RemovePostContant());
  }

  createFaceBookReel() async {
    try {
      emit(CreateFaceBookReelLoading());

      final response = await postReposatory.createFaceeBookReel(
        addPostController.text,
        videoreelUrl!,
      );
      print('llllllllllllllllllllllllllllllllllll $response');
      emit(CreateFaceBookReelSuccessfully());
      return response;
    } catch (e) {
      print(e.toString());
      emit(CreateFaceBookReelFailure(errMessage: e.toString()));
      return e.toString();
    }
  }

  createFaceBookImageSrory() async {
    try {
      emit(CreateFaceBookStoryLoading());

      final response = await postReposatory.createFaceeBookImageStory(
        addPostController.text,
        imgStoryUrl!,
      );
      print('llllllllllllllllllllllllllllllllllll $response');
      emit(CreateFaceBookStorySuccessfully());
      return response;
    } catch (e) {
      print(e.toString());
      emit(CreateFaceBookStoryFailure(errMessage: e.toString()));
      return e.toString();
    }
  }
}
     // img.compositeImage(image, banner!, dstH: 35, dstW: 140, dstX: x, dstY: y);
