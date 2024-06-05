import 'package:dartz/dartz.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import 'package:post_bet/core/api/api_consumer.dart';
import 'package:post_bet/core/api/end_ponits.dart';
import 'package:post_bet/core/errors/exceptions.dart';
import 'package:post_bet/core/utils/service_locator.dart';
import 'package:post_bet/core/utils/shared_preferences_cash_helper.dart';
import 'package:post_bet/features/authentication/data/models/auth_model/auth_model.dart';
import 'package:post_bet/features/authentication/data/models/auth_model/login_model.dart';
import 'package:post_bet/features/authentication/data/models/auth_model/register_model.dart';
import 'package:post_bet/features/authentication/data/models/user_data_model/user_data_response_model.dart';

class AuthRepository {
  final ApiConsumer api;
  AuthRepository({required this.api});

  Future<Either<String, UserResponse>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await api.post(
        EndPoint.login,
        data: {
          ApiKey.email: email,
          ApiKey.password: password,
        },
      );
      final user = UserResponse.fromJson(response);
      final decodedToken = JwtDecoder.decode(user.data.token);
      await getIt
          .get<CashHelperSharedPreferences>()
          .saveData(key: ApiKey.token, value: user.data.token);
      await getIt
          .get<CashHelperSharedPreferences>()
          .saveData(key: ApiKey.id, value: user.data.id);

      // await getIt
      //     .get<CashHelperSharedPreferences>()
      //     .saveData(key: ApiKey.profilePic, value: user.data.profileImage)
      //     .then((value) {
      //   imageFile = File(user.data.profileImage!);
      //   print('bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb $imageFile');
      // });

      print(
          'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa ${getIt.get<CashHelperSharedPreferences>().getData(key: ApiKey.profilePic)}');

      await getIt
          .get<CashHelperSharedPreferences>()
          .saveData(key: ApiKey.profileKey, value: user.data.profileKey);
      await getIt
          .get<CashHelperSharedPreferences>()
          .saveData(key: ApiKey.refId, value: user.data.refId);

      print(decodedToken[ApiKey.id]);

      //myPlan(subscription: user.data.userProgramSubscriptions);

      return Right(user);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage!);
    }
  }

  Future<Either<String, UserProgramSubscription>> myPlan(
      {required List<UserProgramSubscription> subscriptions}) async {
    try {
      await getIt
          .get<CashHelperSharedPreferences>()
          .removeData(key: ApiKey.mySubscribeId);
      // final response = await api.get(
      //   EndPoint.mySubscraption,
      // );
      UserProgramSubscription? mySubscriptionModel;

      // Iterate over the list of subscriptions
      for (var subscription in subscriptions) {
        if (subscription.paymentStatus == 'Paid') {
          // Save the id of the subscription with paymentStatus == 'Paid'
          await getIt
              .get<CashHelperSharedPreferences>()
              .saveData(key: ApiKey.mySubscribeId, value: subscription.id);

          mySubscriptionModel = subscription;

          // Optionally, print the id to verify
          print('Saved subscription id: ${subscription.id}');
          print('yaaaaaaaaaaaaaaaaaaaaaaaaaaaaaarb${mySubscriptionModel}');
        }
      }

      await getIt
          .get<CashHelperSharedPreferences>()
          .saveData(key: ApiKey.mySubscribeId, value: subscriptions.last.id);
      mySubscriptionModel = subscriptions.last;
      print(mySubscriptionModel);

      return Right(mySubscriptionModel!);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage!);
    }
  }

  Future<Either<String, RegisterModel>> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await api.post(
        EndPoint.signUp,
        data: {
          ApiKey.name: name,
          ApiKey.email: email,
          ApiKey.password: password,
        },
      );
      final signUPModel = RegisterModel.fromJson(response);
      return Right(signUPModel);
    } on ServerException catch (e) {
      return Left(e.errModel.error!);
    }
  }

  Future<Either<String, UserDataResponseModel>> getUserProfile() async {
    try {
      final response = await api.get(
        EndPoint.getUserDataEndPoint(
          getIt.get<CashHelperSharedPreferences>().getData(key: ApiKey.id),
        ),
      );
      final user = UserDataResponseModel.fromJson(response);
      print(user.data.profileImage);
      return Right(user);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage!);
    }
  }

  // Future<Either<String, void>> verfyOtp({
  //   required String otp,
  // }) async {
  //   try {
  //     final response = await api.post(
  //       EndPoint.getOtp,
  //       data: {
  //         ApiKey.otp: otp,
  //       },
  //     );
  //     return Right(response);
  //   } on ServerException catch (e) {
  //     return Left(e.errModel.errorMessage!);
  //   }
  // }

  Future<Either<String, AuthResponseModle>> verfyAccount({
    required String eamil,
    required String otp,
  }) async {
    try {
      final response = await api.post(
        EndPoint.verfyAccount,
        data: {
          ApiKey.email: eamil,
          ApiKey.otp: otp,
        },
      );
      final user = AuthResponseModle.fromJson(response);
      final decodedToken = JwtDecoder.decode(user.data.token);
      getIt
          .get<CashHelperSharedPreferences>()
          .saveData(key: ApiKey.token, value: user.data.token);
      getIt
          .get<CashHelperSharedPreferences>()
          .saveData(key: ApiKey.id, value: user.data.id);

      getIt
          .get<CashHelperSharedPreferences>()
          .saveData(key: ApiKey.profileKey, value: user.data.profileKey);
      getIt
          .get<CashHelperSharedPreferences>()
          .saveData(key: ApiKey.refId, value: user.data.refId);
      print(decodedToken[ApiKey.id]);
      return Right(user);
    } on ServerException catch (e) {
      return Left(e.errModel.error!);
    }
  }

  Future<Either<String, void>> forgetPassword({
    required String eamil,
  }) async {
    try {
      final response = await api.post(
        EndPoint.forgotPassword,
        data: {
          ApiKey.email: eamil,
        },
      );

      return Right(response);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage!);
    }
  }

  Future<Either<String, void>> verfyOtpForgetPassword({
    required String otp,
  }) async {
    try {
      final response = await api.post(
        EndPoint.getOtp,
        data: {
          ApiKey.otp: otp,
        },
      );
      return Right(response);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage!);
    }
  }

  Future<Either<String, void>> changeForgetPassword({
    required String email,
    required String newPassword,
  }) async {
    try {
      final response = await api.post(
        EndPoint.changeForgetPassword,
        data: {
          ApiKey.email: email,
          ApiKey.newForgetPassword: newPassword,
        },
      );
      return Right(response);
    } on ServerException catch (e) {
      return Left(e.errModel.errorMessage!);
    }
  }
}
