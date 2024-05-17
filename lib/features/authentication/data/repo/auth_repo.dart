import 'package:dartz/dartz.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:post_bet/core/api/api_consumer.dart';
import 'package:post_bet/core/api/end_ponits.dart';
import 'package:post_bet/core/errors/exceptions.dart';
import 'package:post_bet/core/utils/service_locator.dart';
import 'package:post_bet/core/utils/shared_preferences_cash_helper.dart';
import 'package:post_bet/features/authentication/data/models/auth_model/auth_model.dart';
import 'package:post_bet/features/authentication/data/models/auth_model/register_model.dart';
import 'package:post_bet/features/authentication/data/models/user_data_model/user_data_response_model.dart';

class AuthRepository {
  final ApiConsumer api;
  AuthRepository({required this.api});

  Future<Either<String, AuthResponseModle>> login({
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
      final user = AuthResponseModle.fromJson(response);
      final decodedToken = JwtDecoder.decode(user.data.token);
      getIt
          .get<CashHelperSharedPreferences>()
          .saveData(key: ApiKey.token, value: user.data.token);
      getIt
          .get<CashHelperSharedPreferences>()
          .saveData(key: ApiKey.id, value: decodedToken[ApiKey.id]);

      getIt
          .get<CashHelperSharedPreferences>()
          .saveData(key: ApiKey.profileKey, value: user.data.profileKey);
      getIt
          .get<CashHelperSharedPreferences>()
          .saveData(key: ApiKey.refId, value: user.data.refId);

      print(decodedToken[ApiKey.id]);
      return Right(user);
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
      return Right(UserDataResponseModel.fromJson(response));
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
          .saveData(key: ApiKey.id, value: decodedToken[ApiKey.id]);

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
