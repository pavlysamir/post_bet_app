part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  final List<PhotoItemModel> photos;
  final int photosPage;
  final bool hasReachMax;
  final BlocStatus photosStatus;

  SearchSuccess({
    required this.photos,
    required this.photosPage,
    required this.hasReachMax,
    required this.photosStatus,
  });
}

class SearchFailed extends SearchState {
  final String error;

  SearchFailed({required this.error});
}
