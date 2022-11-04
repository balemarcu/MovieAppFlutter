import 'package:demo1/login/login_payload.dart';
import 'package:demo1/login/token_request.dart';
import 'package:demo1/networking/networking.dart';
import 'package:dio/dio.dart';

class GetRequestTokenApi {
  final NetworkModule networkModule = NetworkModule();

  Future<TokenRequest> getRequestToken() async {
    try {
      final response = await networkModule.dio.get('/authentication/token/new');
      return TokenRequest.fromJson(response.data);
    } on DioError catch (ex) {
      if (ex.response?.statusCode == 401 || ex.response?.statusCode == 404) {
        throw ex.response?.data['status_message'];
      }
      rethrow;
    }
  }
}
