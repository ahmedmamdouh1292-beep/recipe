import 'package:dio/dio.dart';
import 'package:recipy_hub/api_handle/api_error.dart';

class DioExceptions {
  
  static ApiError handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.cancel:
        return ApiError(message: 'Request was cancelled');

      case DioExceptionType.connectionTimeout:
        return ApiError(message: 'Connection timeout');

      case DioExceptionType.sendTimeout:
        return ApiError(message: 'Send timeout');

      case DioExceptionType.receiveTimeout:
        return ApiError(message: 'Receive timeout');

      case DioExceptionType.badResponse:
        return ApiError(
          code: error.response?.statusCode,
          message: error.response?.statusMessage ?? 'Bad response',
        );

      case DioExceptionType.connectionError:
        return ApiError(
          message: 'No internet connection',
        );

      case DioExceptionType.badCertificate:
        return ApiError(
          message: 'Bad certificate',
        );

      case DioExceptionType.unknown:
        return ApiError(
          message: 'Unexpected error occurred',
        );
     default:
        return ApiError(
          message: 'Something went wrong',
        );
    }
  }
}