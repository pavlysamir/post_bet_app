import 'package:dartz/dartz.dart';
import 'package:post_bet/core/api/api_consumer.dart';
import 'package:post_bet/core/api/end_ponits.dart';
import 'package:post_bet/core/errors/exceptions.dart';
import 'package:post_bet/core/utils/service_locator.dart';
import 'package:post_bet/core/utils/shared_preferences_cash_helper.dart';
import 'package:post_bet/features/settings/data/models/message_model.dart';
import 'package:post_bet/features/settings/data/models/plane_model.dart';

class SettingsRepository {
  final ApiConsumer api;
  SettingsRepository({required this.api});

  Future<Either<String, void>> deleteAccount() async {
    try {
      final response = await api.delete(
        EndPoint.getUserDataEndPoint(
          getIt.get<CashHelperSharedPreferences>().getData(key: ApiKey.id),
        ),
      );
      return Right(response);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage!);
    }
  }

  Future<Either<String, List<PlanModel>>> getPlans() async {
    try {
      final response = await api.get(EndPoint.plans);
      List<PlanModel> plans = [];
      for (var item in response['data']['items']) {
        plans.add(PlanModel.fromJson(item));
      }

      print(plans);
      return Right(plans);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage!);
    }
  }

  Future<Either<String, void>> sendMessageContanctUs({
    required String message,
    required String email,
  }) async {
    try {
      final response = await api
          .post(EndPoint.contactUs, data: {"message": message, "phone": email});

      return Right(response);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage!);
    }
  }

  Future<Either<String, List<MessageModel>>> getMessageContanctUs() async {
    try {
      final response = await api.get(
        EndPoint.contactUs,
      );
      List<MessageModel> messages = [];
      for (var item in response['data']['items']) {
        messages.add(MessageModel.fromJson(item));
      }

      return Right(messages);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage!);
    }
  }
}
