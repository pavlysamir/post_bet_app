import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:post_bet/core/Assets/Assets.dart';
import 'package:post_bet/features/home/data/post_repo.dart';

part 'add_post_templete_state.dart';

class AddPostTempleteCubit extends Cubit<AddPostTempleteState> {
  AddPostTempleteCubit(this.postReposatory) : super(AddPostTempleteInitial());

  final PostReposatory postReposatory;
  static AddPostTempleteCubit get(BuildContext context) =>
      BlocProvider.of(context);

  TextEditingController addPostTempleteController = TextEditingController();

  final List<String> selectedItems = [];

  final List<String> selectedaceInstaItems = [];
  final List<String> selectedInstaItems = [];

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
  List<String> descriptionPlatform = [
    'Images,Text,Video',
    'Images ,video',
    'Video',
    'Images,Text,Video',
    'Images ,video',
    'Video',
    'Images, Video',
    'Images, Video',
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

  createImagePost({required String image}) async {
    try {
      emit(CreatePostLoading());

      final response = await postReposatory
          .createPost(addPostTempleteController.text, selectedItems, [image]);
      print(response);
      emit(CreatePostSuccessfully());
      return response;
    } catch (e) {
      print(e.toString());
      emit(CreatePostFailure(errMessage: e.toString()));

      return e.toString();
    }
  }

  createFaceBookImagePost({required String image}) async {
    try {
      emit(CreateFacePostLoading());

      final response = await postReposatory.createFaceBookPost(
          addPostTempleteController.text, selectedItems, [image]);
      print(response);
      emit(CreateFacePostSuccessfully());
      return response;
    } catch (e) {
      print(e.toString());
      emit(CreatePostFailure(errMessage: e.toString()));

      return e.toString();
    }
  }

  createInstagramImagePost({required String image}) async {
    try {
      emit(CreatePostLoading());

      final response = await postReposatory.createInstagramPost(
          addPostTempleteController.text, selectedItems, [image]);
      print(response);
      emit(CreatePostSuccessfully());
      return response;
    } catch (e) {
      print(e.toString());
      emit(CreatePostFailure(errMessage: e.toString()));

      return e.toString();
    }
  }

  String? imgUrl;
  uploadImage({required String image}) async {
    try {
      emit(UploadImageLoading());
      final response = await postReposatory.uploadTempleteFile(image);
      print('aaaaaaaaaaaaaaaaaaaaaaaaaaaa$response');
      imgUrl = response;
      print("nmmnmnmnmnmnmnmnmnmnmn$imgUrl");
      emit(UploadImgSuccessfully());

      createImagePost(image: imgUrl!);
    } catch (e) {
      print(e.toString());
      emit(UploadImgFailure(errMessage: e.toString()));
    }
  }

  String? imagesFaceUrls;
  uploadFaceBokImage({required String image}) async {
    try {
      emit(UploadImageLoading());
      final response = await postReposatory.uploadTempleteFile(image);
      print('aaaaaaaaaaaaaaaaaaaaaaaaaaaa$response');
      imagesFaceUrls = response;

      emit(UploadImgSuccessfully());
      createFaceBookImagePost(image: imagesFaceUrls!);
    } catch (e) {
      print(e.toString());
      emit(UploadImgFailure(errMessage: e.toString()));
    }
  }

  String? imagesInstaUrls;

  uploadInstagramImage({required String image}) async {
    try {
      emit(UploadImageLoading());
      final response = await postReposatory.uploadTempleteFile(image);
      print('aaaaaaaaaaaaaaaaaaaaaaaaaaaa$response');
      imagesFaceUrls = response;

      emit(UploadImgSuccessfully());
      createInstagramImagePost(image: imagesInstaUrls!);
    } catch (e) {
      print(e.toString());
      emit(UploadImgFailure(errMessage: e.toString()));
    }
  }

  String? imgStoryUrl;
  uploadImageStory({required String image}) async {
    try {
      emit(UploadFaceBookImageStoryLoading());

      final response = await postReposatory.uploadFile(image);

      print('aaaaaaaaaaaaaaaaaaaaaaaaaaaa$response');
      imgStoryUrl = response;

      print('لkokokokokokokokokokokokoko$imgStoryUrl');
      emit(UploadFaceBookImageStorySuccessfully());
      createFaceBookImageSrory(image: imgStoryUrl!);
      return response;
    } catch (e) {
      print(e.toString());
      emit(UploadFaceBookImageStoryFailure(errMessage: e.toString()));
      return e.toString();
    }
  }

  createFaceBookImageSrory({required String image}) async {
    try {
      emit(CreateFaceBookStoryLoading());

      final response = await postReposatory.createFaceeBookImageStory(
          addPostTempleteController.text, image);
      print('llllllllllllllllllllllllllllllllllll $response');
      emit(CreateFaceBookStorySuccessfully());
      return response;
    } catch (e) {
      print(e.toString());
      emit(CreateFaceBookStoryFailure(errMessage: e.toString()));
      return e.toString();
    }
  }

  String? imgInstgramStoryUrl;
  uploadInstagramImageStory({required String image}) async {
    try {
      emit(UploadInstagramImageStoryLoading());

      final response = await postReposatory.uploadFile(image);

      print('aaaaaaaaaaaaaaaaaaaaaaaaaaaa$response');
      imgInstgramStoryUrl = response;
      print('لkokokokokokokokokokokokoko$imgInstgramStoryUrl');
      emit(UploadFaceBookImageStorySuccessfully());
      createInstagramImageSrory(image: imgInstgramStoryUrl!);
      return response;
    } catch (e) {
      print(e.toString());
      emit(UploadInstagramImageStoryFailure(errMessage: e.toString()));
      return e.toString();
    }
  }

  createInstagramImageSrory({required String image}) async {
    try {
      emit(CreateInstagramStoryLoading());

      final response = await postReposatory.createInstagramImageStory(
          addPostTempleteController.text, image);
      print('llllllllllllllllllllllllllllllllllll $response');
      emit(CreateInstagramStorySuccessfully());
      return response;
    } catch (e) {
      print(e.toString());
      emit(CreateInstagramStoryFailure(errMessage: e.toString()));
      return e.toString();
    }
  }
}
