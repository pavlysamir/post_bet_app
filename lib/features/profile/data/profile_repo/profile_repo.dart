import 'package:dartz/dartz.dart';
import 'package:post_bet/core/api/api_consumer.dart';
import 'package:post_bet/core/api/end_ponits.dart';
import 'package:post_bet/core/errors/exceptions.dart';
import 'package:post_bet/core/utils/service_locator.dart';
import 'package:post_bet/core/utils/shared_preferences_cash_helper.dart';
import 'package:post_bet/features/profile/data/models/profile_model.dart';

class ProfileRepository {
  final ApiConsumer api;
  ProfileRepository({required this.api});
  Future<Either<String, void>> updateProfileData({
    required String name,
    required String email,
    required String profilePic,
  }) async {
    try {
      final response = await api.put(
        EndPoint.getUserDataEndPoint(
          getIt.get<CashHelperSharedPreferences>().getData(key: ApiKey.id),
        ),
        data: {
          ApiKey.name: name,
          ApiKey.email: email,
          ApiKey.profilePic: profilePic,
        },
      );
      return Right(response);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage!);
    }
  }
}
