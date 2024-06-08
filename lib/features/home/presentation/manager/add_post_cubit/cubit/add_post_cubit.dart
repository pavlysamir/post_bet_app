import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:post_bet/core/Assets/Assets.dart';
import 'package:post_bet/features/home/data/post_repo.dart';

part 'add_post_state.dart';

class AddPostCubit extends Cubit<AddPostState> {
  AddPostCubit(this.postReposatory) : super(AddPostInitial());

  final PostReposatory postReposatory;
  static AddPostCubit get(BuildContext context) => BlocProvider.of(context);

  TextEditingController addPostController = TextEditingController();
  List<String> descriptionPlatform = [
    'Images,Text,Video',
    'Images ,video',
    'Video',
    'Images,Text,Video',
    'Images ,video',
    'Video',
    'Images, Video,text',
    'Images, Video,text',
    'image',
    'image',
    'Video',
    'image',
    'Video',
    'Post',
  ];

  List<String> descriptionPlatform4 = [
    'Images, Text, Video',
    'Images ,video',
    'Video',
    'Images, Text, Video',
    'Images ,video',
    'Video',
    'Posts, Video',
    'image',
  ];

  List<String> descriptionPlatform7 = [
    'Images, Text, Video',
    'Images ,video',
    'Video',
    'Images, Text, Video',
    'Images ,video',
    'Video',
    'Images, Video, text',
    'Images, Video, text',
    'image',
    'image',
    'image',
    'Video',
    'Post',
  ];

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

      emit(SuccessfulPickImage());
    } else {
      emit(FailPickImage());

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
    imagesUrls.clear();
    imagesFaceUrls.clear();
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

      if (imagesFaceUrls.isNotEmpty) {
        imagesFaceUrls.removeAt(0);
      }
      if (imagesInstaUrls.isNotEmpty) {
        imagesInstaUrls.removeAt(0);
      }
      if (kDebugMode) {
        print(postImages.length);
      }
      emit(RemovePostImagePickedState());
    } else if (numOfImg == 2) {
      //postImage2 = null;
      postImages.removeAt(1);

      if (imagesFaceUrls.isNotEmpty) {
        imagesFaceUrls.removeAt(1);
      }
      if (imagesInstaUrls.isNotEmpty) {
        imagesInstaUrls.removeAt(1);
      }
      if (kDebugMode) {
        print(postImages.length);
      }

      emit(RemovePostImagePickedState());
    } else if (numOfImg == 3) {
      //postImage3 = null;
      postImages.removeAt(2);
      if (imagesFaceUrls.isNotEmpty) {
        imagesFaceUrls.removeAt(2);
      }
      if (imagesInstaUrls.isNotEmpty) {
        imagesInstaUrls.removeAt(2);
      }
      if (kDebugMode) {
        print(postImages.length);
      }

      emit(RemovePostImagePickedState());
    }
  }

  final List<String> selectedItems = [];

  final List<String> selectedaceInstaItems = [];
  final List<String> selectedInstaItems = [];

  final List<String> selectedYouTube = [];

  final Map<String, bool> checkBoxValues = {};
  final List<String> platformNames = [
    'Facebook Post',
    'Facebook Story',
    'Facebook Reel',
    'Instagram Post',
    'Instagram Story',
    'Instagram Reel',
    'Twitter',
    'Linkedin',
    'Telegram',
    'Pinterest',
    'Tiktok',
    'Reddit',
    'YouTube',
    'GoogleBusiness'
  ];
  final List<String> platformIcons = [
    AssetsData.instagramIcon,
    AssetsData.faceBookIcon,
    AssetsData.xIcon,
    AssetsData.linkedln,
    AssetsData.telegram,
    AssetsData.pinterest,
    AssetsData.tiktok,
    AssetsData.reddit,
    AssetsData.youtube,
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

  List<String> imagesFaceUrls = [];
  uploadFaceBokImage() async {
    try {
      emit(UploadImageLoading());
      final upload = postImages.map((image) async {
        await postReposatory.uploadFile(image.path).then((value) {
          imagesFaceUrls.add(value);
          print('ccccccccccccccccccccccccccccccc${value}');
        });
      }).toList();
      print(
          'لالالالالالالالالالالالالالالالالالالالالالالالالالالا$imagesFaceUrls');
      emit(UploadImgSuccessfully());
      Future.wait(upload).then((value) {
        createFaceBookImagePost();
      });
      // final response = await postReposatory.uploadFile(filePath);
      // print('aaaaaaaaaaaaaaaaaaaaaaaaaaaa$response');
      // imgUrl = response;
    } catch (e) {
      print(e.toString());
      emit(UploadImgFailure(errMessage: e.toString()));
    }
  }

  List<String> imagesInstaUrls = [];

  uploadInstagramImage() async {
    try {
      emit(UploadImageLoading());
      final upload = postImages.map((image) async {
        await postReposatory.uploadFile(image.path).then((value) {
          imagesInstaUrls.add(value);
          print('ccccccccccccccccccccccccccccccc${value}');
        });
      }).toList();
      print(
          'لالالالالالالالالالالالالالالالالالالالالالالالالالالا$imagesInstaUrls');
      emit(UploadImgSuccessfully());
      Future.wait(upload).then((value) {
        createInstagramImagePost();
      });
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

  String? videoFaceUrl;
  uploadFaceBookVideo() async {
    try {
      emit(UploadVideoLoading());

      final response = await postReposatory.uploadFile(fileVideo!.path);

      print('aaaaaaaaaaaaaaaaaaaaaaaaaaaa$response');
      videoFaceUrl = response;
      print(
          'لالالالالالالالالالالالالالالالالالالالالالالالالالالا$videoFaceUrl');
      emit(UploadVideoSuccessfully());
      createFaceBookVideoPost();
      return response;
    } catch (e) {
      print(e.toString());
      emit(UploadVideoFailure(errMessage: e.toString()));
      return e.toString();
    }
  }

  String? videoInstaUrl;
  uploadInstagramVideo() async {
    try {
      emit(UploadVideoLoading());

      final response = await postReposatory.uploadFile(fileVideo!.path);

      print('aaaaaaaaaaaaaaaaaaaaaaaaaaaa$response');
      videoFaceUrl = response;
      print(
          'لالالالالالالالالالالالالالالالالالالالالالالالالالالا$videoFaceUrl');
      emit(UploadVideoSuccessfully());
      createInstagramVideoPost();
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

  String? videoIstareelUrl;
  uploadInstagramReelVideo() async {
    try {
      emit(UploadFaceBookReelLoading());

      final response = await postReposatory.uploadFile(fileVideo!.path);

      print('aaaaaaaaaaaaaaaaaaaaaaaaaaaa$response');
      videoIstareelUrl = response;
      print('لkokokokokokokokokokokokoko$videoIstareelUrl');
      emit(UploadFaceBookReelSuccessfully());
      createInstagramReel();
      return response;
    } catch (e) {
      print(e.toString());
      emit(UploadFaceBookReelFailure(errMessage: e.toString()));
      return e.toString();
    }
  }

  String? videoStoryFaceBookUrl;
  uploadVideoStoryFsaceBookVideo() async {
    try {
      emit(UploadFaceBookReelLoading());

      final response = await postReposatory.uploadFile(fileVideo!.path);

      print('aaaaaaaaaaaaaaaaaaaaaaaaaaaa$response');
      videoStoryFaceBookUrl = response;
      print('لkokokokokokokokokokokokoko$videoStoryFaceBookUrl');
      emit(UploadFaceBookReelSuccessfully());
      createVideoFaceBookStory();
      return response;
    } catch (e) {
      print(e.toString());
      emit(UploadFaceBookReelFailure(errMessage: e.toString()));
      return e.toString();
    }
  }

  String? videoStoryInstagramUrl;
  uploadVideoStoryInstagramVideo() async {
    try {
      emit(UploadFaceBookReelLoading());

      final response = await postReposatory.uploadFile(fileVideo!.path);

      print('aaaaaaaaaaaaaaaaaaaaaaaaaaaa$response');
      videoStoryInstagramUrl = response;
      print('لkokokokokokokokokokokokoko$videoStoryInstagramUrl');
      emit(UploadFaceBookReelSuccessfully());
      createVideoInstagramStory();
      return response;
    } catch (e) {
      print(e.toString());
      emit(UploadFaceBookReelFailure(errMessage: e.toString()));
      return e.toString();
    }
  }

  String? videoYoutubeUrl;
  uploadVideoYoutubeVideo() async {
    try {
      emit(UploadYouTubeVideoLoading());

      final response = await postReposatory.uploadFile(fileVideo!.path);

      print('aaaaaaaaaaaaaaaaaaaaaaaaaaaa$response');
      videoYoutubeUrl = response;
      print('لkokokokokokokokokokokokoko$videoYoutubeUrl');
      emit(UploadYouTubeVideoSuccessfully());
      createVideoYoutube();
      return response;
    } catch (e) {
      print(e.toString());
      emit(UploadYouTubeVideoFailure(errMessage: e.toString()));
      return e.toString();
    }
  }

  createVideoYoutube() async {
    try {
      emit(CreateYoutubeVideoLoading());

      // Check if addPostController.text is null or empty
      final postText = addPostController.text?.isEmpty ?? true
          ? "."
          : addPostController.text;

      final response = await postReposatory.createYouTubeVideoPost(
        postText,
        videoYoutubeUrl!,
      );

      print('llllllllllllllllllllllllllllllllllll $response');
      emit(CreateYoutubeVideoSuccessfully());
      return response;
    } catch (e) {
      print(e.toString());
      emit(CreateYoutubeVideoFailure(errMessage: e.toString()));
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

  String? imgInstgramStoryUrl;
  uploadInstagramImageStory() async {
    try {
      emit(UploadInstagramImageStoryLoading());

      final response = await postReposatory.uploadFile(imageFile!.path);

      print('aaaaaaaaaaaaaaaaaaaaaaaaaaaa$response');
      imgInstgramStoryUrl = response;
      print('لkokokokokokokokokokokokoko$imgInstgramStoryUrl');
      emit(UploadFaceBookImageStorySuccessfully());
      createInstagramImageSrory();
      return response;
    } catch (e) {
      print(e.toString());
      emit(UploadInstagramImageStoryFailure(errMessage: e.toString()));
      return e.toString();
    }
  }

  String? uploasedStoryImg;

  createImagePost() async {
    try {
      emit(CreatePostLoading());
      print('/////////////////////////////////$imagesUrls');
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

  createFaceBookImagePost() async {
    try {
      emit(CreateFacePostLoading());

      final response = await postReposatory.createFaceBookPost(
          addPostController.text, selectedItems, imagesFaceUrls);
      print(response);
      emit(CreateFacePostSuccessfully());
      return response;
    } catch (e) {
      print(e.toString());
      emit(CreatePostFailure(errMessage: e.toString()));

      return e.toString();
    }
  }

  createInstagramImagePost() async {
    try {
      emit(CreatePostLoading());

      final response = await postReposatory.createInstagramPost(
          addPostController.text, selectedItems, imagesInstaUrls);
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

  createFaceBookTextPost() async {
    try {
      emit(CreateFaceTextPostLoading());

      final response = await postReposatory.createFaceBookTextPost(
        addPostController.text,
        selectedItems,
      );
      print(response);
      emit(CreateFaceTextPostSuccessfully());
      return response;
    } catch (e) {
      print(e.toString());
      emit(CreateFaceTextPostFailure(errMessage: e.toString()));

      return e.toString();
    }
  }

  createInstagramTextPost() async {
    try {
      emit(CreateInstagramTextPostLoading());

      final response = await postReposatory.createInstagramTextPost(
        addPostController.text,
        selectedItems,
      );
      print(response);
      emit(CreateInstagramTextPostSuccessfully());
      return response;
    } catch (e) {
      print(e.toString());
      emit(CreateInstagramTextPostFailure(errMessage: e.toString()));

      return e.toString();
    }
  }

  createVideoPost() async {
    try {
      emit(CreateVideoPostLoading());
      final response = await postReposatory.createVideoPost(
        addPostController.text,
        selectedItems,
        videoUrl!,
      );
      print(response);
      emit(CreateVideoPostSuccessfully());
      return response;
    } catch (e) {
      print(e.toString());
      emit(CreateVideoPostFailure(errMessage: e.toString()));
      return e.toString();
    }
  }

  createFaceBookVideoPost() async {
    try {
      emit(CreateFaceBookVideoPostLoading());

      final response = await postReposatory.createFaceBookVideoPost(
        addPostController.text,
        selectedItems,
        videoFaceUrl!,
      );
      print(response);
      emit(CreateFaceBookVideoPostSuccessfully());
      return response;
    } catch (e) {
      print(e.toString());
      emit(CreateFaceBookVideoPostFailure(errMessage: e.toString()));
      return e.toString();
    }
  }

  createInstagramVideoPost() async {
    try {
      emit(CreateInstagramVideoPostLoading());

      final response = await postReposatory.createInstagramVideoPost(
        addPostController.text,
        selectedItems,
        videoInstaUrl!,
      );
      print(response);
      emit(CreateInstagramVideoPostSuccessfully());
      return response;
    } catch (e) {
      print(e.toString());
      emit(CreateInstagramVideoPostFailure(errMessage: e.toString()));
      return e.toString();
    }
  }

  void clearpostContant() {
    postImages.clear();
    print(postImages.length);
    fileVideo = null;
    //image = null;
    displayVideo = null;
    addPostController.clear();
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

  createInstagramReel() async {
    try {
      emit(CreateInstagramReelLoading());

      final response = await postReposatory.createInstagramReel(
        addPostController.text,
        videoIstareelUrl!,
      );
      print('llllllllllllllllllllllllllllllllllll $response');
      emit(CreateInstagramReelSuccessfully());
      return response;
    } catch (e) {
      print(e.toString());
      emit(CreateInstagramReelFailure(errMessage: e.toString()));
      return e.toString();
    }
  }

  createVideoFaceBookStory() async {
    try {
      emit(CreateFaceBookVideoStoryLoading());

      final response = await postReposatory.createFaceeBookVideoStory(
        addPostController.text,
        videoStoryFaceBookUrl!,
      );
      print('llllllllllllllllllllllllllllllllllll $response');
      emit(CreateFaceBookVideoStorySuccessfully());
      return response;
    } catch (e) {
      print(e.toString());
      emit(CreateFaceBookVideoStoryFailure(errMessage: e.toString()));
      return e.toString();
    }
  }

  createVideoInstagramStory() async {
    try {
      emit(CreateInstagramVideoStoryLoading());

      final response = await postReposatory.createInstagramVideoStory(
        addPostController.text,
        videoStoryInstagramUrl!,
      );
      print('llllllllllllllllllllllllllllllllllll $response');
      emit(CreateInstagramVideoStorySuccessfully());
      return response;
    } catch (e) {
      print(e.toString());
      emit(CreateInstagramVideoStoryFailure(errMessage: e.toString()));
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

  createInstagramImageSrory() async {
    try {
      emit(CreateInstagramStoryLoading());

      final response = await postReposatory.createInstagramImageStory(
        addPostController.text,
        imgInstgramStoryUrl!,
      );
      print('llllllllllllllllllllllllllllllllllll $response');
      emit(CreateInstagramStorySuccessfully());
      return response;
    } catch (e) {
      print(e.toString());
      emit(CreateInstagramStoryFailure(errMessage: e.toString()));
      return e.toString();
    }
  }

  Future<void> handleActionShare() async {
    emit(ShareActionLoading());
    try {
      // Upload images
      await handleAction().then((value) {});
      // Emit success state after all operations are completed
    } catch (e) {
      // Emit failure state if any error occurs
      emit(ShareActionFailure(errMessage: e.toString()));
    }
  }

  Future<void> handleAction() async {
    if (imageFile != null && selectedaceInstaItems.contains('Facebook Story')) {
      await uploadImageStory();
    }
    if (imageFile != null && selectedInstaItems.contains('Instagram Story')) {
      await uploadInstagramImageStory();
    }
    if (imageFile != null && selectedaceInstaItems.contains('Facebook Post')) {
      await uploadFaceBokImage();
    }
    if (imageFile != null && selectedInstaItems.contains('Instagram Post')) {
      await uploadInstagramImage();
    }
    if (postImages.isNotEmpty && selectedItems.isNotEmpty) {
      await uploadImage();
    }

    // Upload videos
    if (fileVideo != null && selectedaceInstaItems.contains('Facebook Reel')) {
      await uploadReelVideo();
    }
    if (fileVideo != null && selectedInstaItems.contains('Instagram Reel')) {
      await uploadInstagramReelVideo();
    }
    if (fileVideo != null && selectedInstaItems.contains('Instagram Story')) {
      await uploadVideoStoryInstagramVideo();
    }
    if (fileVideo != null && selectedaceInstaItems.contains('Facebook Story')) {
      await uploadVideoStoryFsaceBookVideo();
    }
    if (fileVideo != null && selectedaceInstaItems.contains('Facebook Post')) {
      await uploadFaceBookVideo();
    }
    if (fileVideo != null && selectedInstaItems.contains('Instagram Post')) {
      await uploadInstagramVideo();
    }
    if (fileVideo != null && selectedYouTube.contains('YouTube')) {
      await uploadVideoYoutubeVideo();
    }
    if (fileVideo != null && selectedItems.isNotEmpty) {
      await uploadVideo();
    }

    // Create text posts
    if (addPostController.text.isNotEmpty &&
        fileVideo == null &&
        postImages.isEmpty) {
      await createTextPost();
    }
    if (selectedaceInstaItems.contains('Facebook Post') &&
        addPostController.text.isNotEmpty &&
        fileVideo == null &&
        postImages.isEmpty) {
      await createFaceBookTextPost();
    }
    if (selectedInstaItems.contains('Instagram Post') &&
        postImages.isEmpty &&
        fileVideo == null &&
        addPostController.text.isNotEmpty) {
      await createInstagramTextPost();
    }
  }
}
// img.compositeImage(image, banner!, dstH: 35, dstW: 140, dstX: x, dstY: y);
