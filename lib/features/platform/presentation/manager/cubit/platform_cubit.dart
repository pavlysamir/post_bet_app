import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:post_bet/features/platform/data/repo/platforms_repo.dart';

part 'platform_state.dart';

class PlatformCubit extends Cubit<PlatformState> {
  PlatformCubit(this.platFormsRepositery) : super(PlatformInitial());

  final PlatFormsRepositery platFormsRepositery;

  static PlatformCubit? get(context) => BlocProvider.of(context);

  Future<String> linkAcount() async {
    String? url;
    emit(LinkAcoountLoading());
    final response = await platFormsRepositery.linkAccount();
    response.fold((l) {
      emit(LinkAcoountFailure(errMessage: l));
    }, (r) {
      url = r;

      emit(LinkAcoountSuccess());
    });
    return url!;
  }
}
