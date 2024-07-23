import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

part 'details_photo_state.dart';

class DetailsPhotosCubit extends Cubit<DetailsPhotosState> {
  final dio = Dio();
  DetailsPhotosCubit() : super(DetailsPhotoInitial());
  static DetailsPhotosCubit get(BuildContext context) =>
      BlocProvider.of(context);
  void downloadPhoto(String photoUrl) async {
    if (state is PhotoDownloading) return;

    final date = DateTime.now().millisecondsSinceEpoch;
    final directory = await _getDirectory();

    if (directory == null) return;

    try {
      final path = directory.path;
      final file = File("$path/$date.jpeg");
      emit(PhotoDownloading());
      final response = await dio.download(
        photoUrl,
        file.path,
        deleteOnError: true,
      );
      if (response.statusCode == 200) {
        emit(PhotoDownloadedSuccess());
      }
    } catch (e) {
      emit(PhotoError(error: e.toString()));
    } finally {
      emit(DetailsPhotoInitial());
    }
  }

  Future<Directory?> _getDirectory() async {
    Directory? directory;

    if (Platform.isAndroid) {
      var storage = await Permission.storage.isGranted;
      if (!storage) {
        var status = await Permission.storage.request();
        if (!status.isGranted) return null;
      }

      var externalStorage = await Permission.manageExternalStorage.isGranted;
      if (!externalStorage) {
        var status = await Permission.manageExternalStorage.request();
        if (!status.isGranted) return null;
      }

      directory = await getExternalStorageDirectory();

      String newPath = "";
      final paths = directory?.path.split("/");
      for (var i = 1; i < (paths?.length ?? 0); i++) {
        String path = paths?[i] ?? "";
        if (path == "Android") break;

        newPath += "/$path";
      }

      newPath += "/Pictures/Pexel";

      directory = Directory(newPath);
    } else {
      var photos = await Permission.photos.isGranted;
      if (!photos) {
        var status = await Permission.photos.request();
        if (!status.isGranted) return null;
      }

      directory = await getApplicationDocumentsDirectory();
    }

    if (!await directory.exists()) {
      directory.create(recursive: true);
    }

    return directory;
  }

  Uint8List? image;
  Future<Uint8List?> urlToUint8List(String photoUrl) async {
    try {
      final response = await http.get(Uri.parse(photoUrl));
      if (response.statusCode == 200) {
        image = response.bodyBytes;
        return response.bodyBytes;
      } else {
        print('Failed to load image: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error occurred while fetching image: $e');
      return null;
    }
  }
}
