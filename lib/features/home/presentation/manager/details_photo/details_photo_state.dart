part of 'details_photo_cubit.dart';

@immutable
sealed class DetailsPhotosState {}

final class DetailsPhotoInitial extends DetailsPhotosState {}

final class PhotoDownloading extends DetailsPhotosState {}

final class PhotoDownloadedSuccess extends DetailsPhotosState {}

final class PhotoError extends DetailsPhotosState {
  final String error;

  PhotoError({required this.error});
}
