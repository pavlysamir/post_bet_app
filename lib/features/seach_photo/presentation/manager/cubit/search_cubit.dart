import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:post_bet/features/home/data/models/photo/photo_model.dart';
import 'package:post_bet/features/seach_photo/presentation/manager/cubit/bloc_status.dart';
import 'package:post_bet/features/seach_photo/repository/search_repository.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.repo) : super(SearchInitial());
  final SearchRepository repo;

  String keyword = "";
  int photosPage = 1;

  void onKeywordChange(String value) {
    keyword = value;
    emit(SearchInitial());
  }

  void clearKeyword() {
    keyword = "";
    emit(SearchInitial());
  }

  List<PhotoItemModel> photos = [];

  void searchPhotos({
    bool showLoading = true,
    int page = 1,
  }) async {
    if (showLoading) emit(SearchLoading());
    try {
      final result = await repo.searchPhotoByKeyword(page, 24, keyword);

      if (page == 1) {
        emit(SearchSuccess(
          photos: result,
          photosPage: page,
          hasReachMax: result.isEmpty,
          photosStatus: BlocStatus.success,
        ));
        return;
      }

      final currentState = state;
      if (currentState is SearchSuccess) {
        emit(SearchSuccess(
          photos: List.from(currentState.photos)..addAll(result),
          photosPage: page,
          hasReachMax: result.isEmpty,
          photosStatus: BlocStatus.success,
        ));
      }
    } catch (e) {
      emit(SearchFailed(error: e.toString()));
    }
  }

  void getNextPhotos() {
    final nextPage =
        (state is SearchSuccess) ? (state as SearchSuccess).photosPage + 1 : 2;
    searchPhotos(showLoading: false, page: nextPage);
  }
}
