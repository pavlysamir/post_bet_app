// import 'package:bloc/bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:meta/meta.dart';
// import 'package:post_bet/core/Assets/Assets.dart';
// import 'package:post_bet/features/home/data/post_repo.dart';

// part 'add_post_templete_state.dart';

// class AddPostTempleteCubit extends Cubit<AddPostTempleteState> {
//   AddPostTempleteCubit(this.postReposatory) : super(AddPostTempleteInitial());

//   final PostReposatory postReposatory;
//   static AddPostTempleteCubit get(BuildContext context) =>
//       BlocProvider.of(context);

//   TextEditingController addPostTempleteController = TextEditingController();

//   final List<String> selectedItems = [];

//   final List<String> selectedaceInstaItems = [];
//   final List<String> selectedInstaItems = [];

//   final Map<String, bool> checkBoxValues = {};
//   final List<String> platformNames = [
//     'Instagram',
//     'Facebook',
//     'Twitter',
//     'Linkedin',
//     'Reddit',
//     'Youtube',
//     'Tiktok',
//     'Pinterest',
//     'Telegram',
//     'Google Business'
//   ];
//   final List<String> platformIcons = [
//     AssetsData.instagramIcon,
//     AssetsData.faceBookIcon,
//     AssetsData.xIcon,
//     AssetsData.linkedln,
//     AssetsData.reddit,
//     AssetsData.youtube,
//     AssetsData.tiktok,
//     AssetsData.pinterest,
//     AssetsData.telegram,
//     AssetsData.googleBusiness
//   ];


//   createImagePost() async {
//     try {
//       emit(CreatePostLoading());

//       final response = await postReposatory.createPost(
//           addPostController.text, selectedItems, imagesUrls);
//       print(response);
//       emit(CreatePostSuccessfully());
//       return response;
//     } catch (e) {
//       print(e.toString());
//       emit(CreatePostFailure(errMessage: e.toString()));

//       return e.toString();
//     }
//   }

//   createFaceBookImagePost() async {
//     try {
//       emit(CreateFacePostLoading());

//       final response = await postReposatory.createFaceBookPost(
//           addPostController.text, selectedItems, imagesFaceUrls);
//       print(response);
//       emit(CreateFacePostSuccessfully());
//       return response;
//     } catch (e) {
//       print(e.toString());
//       emit(CreatePostFailure(errMessage: e.toString()));

//       return e.toString();
//     }
//   }

//   createInstagramImagePost() async {
//     try {
//       emit(CreatePostLoading());

//       final response = await postReposatory.createInstagramPost(
//           addPostController.text, selectedItems, imagesInstaUrls);
//       print(response);
//       emit(CreatePostSuccessfully());
//       return response;
//     } catch (e) {
//       print(e.toString());
//       emit(CreatePostFailure(errMessage: e.toString()));

//       return e.toString();
//     }
//   }
// }
