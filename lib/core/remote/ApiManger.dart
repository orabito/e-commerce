import 'package:dio/dio.dart';

import '../resources/constants_manager.dart';

class ApiManger {
  late Dio dio;

  ApiManger() {
    dio = Dio(BaseOptions(baseUrl: AppConstants.baseUrl));
  }

  Future<Response> getRequest(
      {required String path,
      Map<String, dynamic>? parameters,
      Map<String, dynamic>? headers}) {
    return dio.get(path,
        queryParameters: parameters, options: Options(headers: headers));
  }

  Future<Response> postRequestRaw(
      {required String path,
      Map<String, dynamic>? body,
      Map<String, dynamic>? headers}) {
    return dio.post(path, data: body, options: Options(headers: headers));
  }

  Future<Response> postRequestFormData(
      {required String path,
      required Map<String, dynamic> body,
      Map<String, dynamic>? headers}) {
    return dio.post(path,
        data: FormData.fromMap(body), options: Options(headers: headers));
  }
  Future<Response> deleteRequest({required String path}){
    return dio.delete(path);
  }
}
