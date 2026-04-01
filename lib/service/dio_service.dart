import 'package:dio/dio.dart';

class DioService {
  late final Dio dio;

  DioService() {
    BaseOptions options = BaseOptions(
      baseUrl: 'http://192.168.2.1:3000',
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    );
    dio = Dio(options);
  }

  Future<Response> dioError(DioException exp) async {
    return exp.response == null
        ? Response(requestOptions: RequestOptions(), data: {"success": false, "message": exp.message})
        : exp.response ?? Response(requestOptions: RequestOptions(), data: {"success": false, "message": "Bir şeyler ters gitti!"});
  }
}