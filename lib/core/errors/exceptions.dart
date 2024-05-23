import 'package:dio/dio.dart';
import 'package:post_bet/core/errors/error_model.dart';

class ServerException implements Exception {
  final ErrorModel errModel;

  ServerException({required this.errModel});
}

void handleDioExceptions(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      throw ServerException(errModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.sendTimeout:
      throw ServerException(errModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.receiveTimeout:
      throw ServerException(errModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.badCertificate:
      throw ServerException(errModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.cancel:
      throw ServerException(errModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.connectionError:
      if (e.response != null) {
        throw ServerException(errModel: ErrorModel.fromJson(e.response!.data));
      } else {
        // Handle the case where response is null
        throw ServerException(
            errModel: ErrorModel(
                errorMessage: 'Connection error',
                error: 'Connection error',
                status: 500));
      }

    case DioExceptionType.unknown:
      throw ServerException(errModel: ErrorModel.fromJson(e.response!.data));
    case DioExceptionType.badResponse:
      switch (e.response?.statusCode) {
        case 400: // Bad request
          throw ServerException(
              errModel: ErrorModel.fromJson(e.response!.data));
        case 401: //unauthorized
          throw ServerException(
              errModel: ErrorModel.fromJson(e.response!.data));
        case 403: //forbidden
          throw ServerException(
              errModel: ErrorModel.fromJson(e.response!.data));
        case 404: //not found
          throw ServerException(
              errModel: ErrorModel.fromJson(e.response!.data));
        case 409: //cofficient
          throw ServerException(
              errModel: ErrorModel.fromJson(e.response!.data));
        case 422: //  Unprocessable Entity
          throw ServerException(
              errModel: ErrorModel.fromJson(e.response!.data));
        case 504: // Server exception
          throw ServerException(
              errModel: ErrorModel.fromJson(e.response!.data));
      }
  }
}
