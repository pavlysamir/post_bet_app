part of 'photo_cubit.dart';

@immutable
sealed class PhotoState {}

final class PhotoInitial extends PhotoState {}

final class GetCleectionLoading extends PhotoState {}

final class GetCleectionSuccess extends PhotoState {
  final List<CollectionItemModel> collections;
  GetCleectionSuccess({required this.collections});
}

final class GetCleectionFuailed extends PhotoState {
  final String error;
  GetCleectionFuailed({required this.error});
}

final class GetPhotoLoading extends PhotoState {}

final class GetPhotoSuccess extends PhotoState {
  final List<PhotoItemModel> photo;
  GetPhotoSuccess({required this.photo});
}

final class GetPhotoFuailed extends PhotoState {
  final String error;
  GetPhotoFuailed({required this.error});
}
