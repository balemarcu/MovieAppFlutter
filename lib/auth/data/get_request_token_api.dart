// import 'package:demo1/login/token_request.dart';
import 'package:demo1/auth/data/token_request.dart';
import 'package:demo1/core/network/networking.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetRequestTokenApi {
  //final NetworkModule networkModule;
  final Dio dio;

  GetRequestTokenApi(this.dio);

  Future<TokenRequest> getRequestToken() async {
    try {
      final response = await dio.get('/authentication/token/new');
      //print(response.toString());
      return TokenRequest.fromJson(response.data);
    } on DioError catch (ex) {
      if (ex.response?.statusCode == 401 || ex.response?.statusCode == 404) {
        throw ex.response?.data['status_message'];
      }
      rethrow;
    }
  }
}
