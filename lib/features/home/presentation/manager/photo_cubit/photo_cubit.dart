import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:post_bet/features/home/data/models/collection/collection_model.dart';
import 'package:post_bet/features/home/data/models/photo/photo_model.dart';
import 'package:post_bet/features/home/data/photos_repo.dart';

part 'photo_state.dart';

class PhotoCubit extends Cubit<PhotoState> {
  PhotoCubit(this.photoRepositiry) : super(PhotoInitial());
  final PhotoRepositiry photoRepositiry;
  static PhotoCubit get(BuildContext context) => BlocProvider.of(context);

  void getCollection({
    bool showLoading = true,
  }) async {
    if (showLoading) {
      emit(GetCleectionLoading());
    }
    ;

    try {
      final result = await photoRepositiry.getCollections(30);
      if (!showLoading) {
        emit(GetCleectionLoading());
      }
      emit(GetCleectionSuccess(collections: result));
    } catch (e) {
      if (!showLoading) {
        emit(GetCleectionLoading());
      }
      emit(GetCleectionFuailed(error: e.toString()));
    }
  }

  List<PhotoItemModel> photo = [];
  void getPhotos({
    bool showLoading = true,
    int page = 1,
  }) async {
    if (showLoading) emit(GetPhotoLoading());
    try {
      final result = await photoRepositiry.getPhotos(page, 24);
      photo = result;

      if (page == 1) {
        emit(GetPhotoSuccess(photo: result));

        return;
      }

      emit(GetPhotoSuccess(photo: result));
    } catch (e) {
      if (!showLoading) {
        emit(GetPhotoLoading());
      }
      emit(GetPhotoFuailed(error: e.toString()));
    }
  }
}
