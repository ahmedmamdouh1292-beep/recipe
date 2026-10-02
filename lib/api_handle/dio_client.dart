import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio=Dio(BaseOptions(
    baseUrl: 'https://www.themealdb.com/api/json/v1/1/', 
    
  ));

  dioClient() {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        final token = 'your_token_here'; 
        if(token.isNotEmpty) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(options);
      }
     
    ));
    
  }
 Dio get dio => _dio;
 
}