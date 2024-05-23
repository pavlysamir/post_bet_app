import 'package:dartz/dartz.dart';
import 'package:post_bet/core/api/api_consumer.dart';
import 'package:post_bet/core/api/end_ponits.dart';
import 'package:post_bet/core/errors/exceptions.dart';
import 'package:post_bet/core/utils/service_locator.dart';
import 'package:post_bet/core/utils/shared_preferences_cash_helper.dart';
import 'package:post_bet/features/settings/data/models/message_model.dart';
import 'package:post_bet/features/settings/data/models/my_subscription_model.dart';
import 'package:post_bet/features/settings/data/models/parse_subscription_response.dart';
import 'package:post_bet/features/settings/data/models/plane_model.dart';
import 'package:post_bet/features/settings/data/models/subscription_model.dart';

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

  Future<Either<String, void>> getPromoCode() async {
    try {
      final response = await api.get(
        EndPoint.promocode,
      );
      return Right(response);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage!);
    }
  }

  Future<Either<String, void>> changePassword({
    required String oldPassword,
    required String newPassword,
  }) async {
    try {
      final response = await api.post(EndPoint.changePassword, data: {
        ApiKey.oldPassword: oldPassword,
        ApiKey.newPassword: newPassword,
      });
      return Right(response);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage!);
    }
  }

  Future<Either<String, SubscriptionModel>> subscriptePlan({
    String? promoCode,
    required String planId,
  }) async {
    try {
      final response = await api.post(EndPoint.subscraption, data: {
        ApiKey.promoCode: promoCode,
        ApiKey.planId: planId,
      });
      final subscription = SubscriptionModel.fromJson(response['data']);

      return Right(subscription);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage!);
    }
  }

  Future<Either<String, void>> confirmSubscriptePlan({
    required String chargeId,
  }) async {
    try {
      final response = await api
          .get(EndPoint.confirnSubscribeEndPoint(chargeId), data: {chargeId});
      return Right(response);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage!);
    }
  }

  Future<Either<String, String>> mySubscriptePlan() async {
    try {
      final response = await api.get(
        EndPoint.mySubscraption,
      );
      SubscriptionResponse myListResponse =
          SubscriptionResponse.fromJson(response['data']);
      String myCharger = '';
      // Iterate over the list of subscriptions
      for (var subscription in myListResponse.subscriptions) {
        if (subscription.paymentStatus == 'Paid') {
          // Save the id of the subscription with paymentStatus == 'Paid'
          await getIt
              .get<CashHelperSharedPreferences>()
              .saveData(key: ApiKey.mySubscribeId, value: subscription.id);

          // Optionally, print the id to verify
          print('Saved subscription id: ${subscription.id}');
        }
      }
      await getIt.get<CashHelperSharedPreferences>().saveData(
          key: ApiKey.chargeId,
          value: myListResponse.subscriptions.last.chargeId);
      myCharger = myListResponse.subscriptions.last.chargeId;

      await getIt.get<CashHelperSharedPreferences>().saveData(
          key: ApiKey.mySubscribeId,
          value: myListResponse.subscriptions.last.id);

      print(myCharger);
      // Example: also save the chargeId of the first subscription in the list
      MySubscriptionModel firstSubscription = myListResponse.subscriptions[0];

      // // Print the chargeId to verify
      // print(myCharger);

      return Right(myCharger);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage!);
    }
  }
}
