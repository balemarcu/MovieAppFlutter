// import 'package:demo1/login/token_request.dart';
import 'package:demo1/auth/data/token_request.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../core/network/networking.dart';
import 'login_payload.dart';
// import '../../login/login_payload.dart';

@lazySingleton
class LoginApi {
  //final NetworkModule networkModule;

  final Dio dio;
  LoginApi(this.dio);

  Future<TokenRequest> login(final LoginPayload payload) async {
    try {
      final response = await dio.post(
          '/authentication/token/validate_with_login',
          data: payload.toJson());
      return TokenRequest.fromJson(response.data);
    } on DioError catch (ex) {
      if (ex.response?.statusCode == 401 || ex.response?.statusCode == 404) {
        throw ex.response?.data['status_message'];
      }
      rethrow;
    }
  }
}
