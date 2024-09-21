import 'package:dio/dio.dart';
import 'package:male_app/core/database/api/api_consumer.dart';
import 'package:male_app/core/database/api/end_points.dart';
import 'package:male_app/core/errors/exceptions.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.options.baseUrl = EndPoints.baseUrl;
  }
  @override
  Future delete(String path,
      {Object? data, Map<String, dynamic>? queryParameters}) async {
    try {
      var res = await dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return res.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

  @override
  Future get(String path,
      {Object? data, Map<String, dynamic>? quaryParameter}) async {
    try {
      var res =
          await dio.get(path, data: data, queryParameters: quaryParameter);
      return res.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

  @override
  Future patch(String path,
      {data,
      Map<String, dynamic>? queryParameters,
      bool isFormData = false}) async {
    try {
      var res = await dio.patch(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return res.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

  @override
  Future post(String path,
      {data,
      Map<String, dynamic>? queryParameters,
      bool isFormData = false}) async {
    try {
      await dio.post(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
    } on DioException catch (e) {
      handleDioException(e);
    }
  }
}
