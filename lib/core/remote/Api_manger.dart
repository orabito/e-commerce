import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../resources/constants_manager.dart';

@singleton
class ApiManger {
  late Dio dio;

  ApiManger() {
    dio = Dio(BaseOptions(
      baseUrl: AppConstants.baseUrl,
      validateStatus: (status) {
        if ((status! >= 200 && status < 300) ||
            (status == 409) ||
            (status == 401)) {
          return true;
        }
        return false;
      },
    ));
  }

  Future<Response> getRequest({
    required String path,
    Map<String, dynamic>? parameters,
    Map<String, dynamic>? headers,
  }) {
    return dio.get(path,
        queryParameters: parameters, options: Options(headers: headers));
  }

  Future<Response> postRequestRow(
      {Map<String, dynamic>? headers,
      required String path,
      Map<String, dynamic>? body}) {
    return dio.post(path, data: body, options: Options(headers: headers));
  }

  Future<Response> postRequestFormData(
      {required Map<String, dynamic>? headers,
      required String path,
      required Map<String, dynamic> body}) {
    return dio.post(path,
        data: FormData.fromMap(body), options: Options(headers: headers));
  }

  Future<Response> deleteRequest(
      {required String path, Map<String, dynamic>? headers}) {
    return dio.delete(path, options: Options(headers: headers));
  }
}

// class ApiManger {
//   late Dio dio;
//
//   ApiManger() {
//     dio = Dio(BaseOptions(baseUrl: AppConstants.baseUrl));
//   }
//
//   Future<Response> getRequest(
//       {required String path,
//       Map<String, dynamic>? parameters,
//       Map<String, dynamic>? headers}) {
//     return dio.get(path,
//         queryParameters: parameters, options: Options(headers: headers));
//   }
//
//   Future<Response> postRequestRaw(
//       {required String path,
//       Map<String, dynamic>? body,
//       Map<String, dynamic>? headers}) {
//     return dio.post(path, data: body, options: Options(headers: headers));
//   }
//
//   Future<Response> postRequestFormData(
//       {required String path,
//       required Map<String, dynamic> body,
//       Map<String, dynamic>? headers}) {
//     return dio.post(path,
//         data: FormData.fromMap(body), options: Options(headers: headers));
//   }
//   Future<Response> deleteRequest({required String path}){
//     return dio.delete(path);
//   }
// }
