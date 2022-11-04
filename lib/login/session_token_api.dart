import 'package:demo1/login/session.dart';
import 'package:demo1/login/session_request.dart';
import 'package:dio/dio.dart';

import '../networking/networking.dart';

class SessionTokenApi {
  final NetworkModule networkModule = NetworkModule();

  Future<SessionRequest> newSession(final SessionLoad load) async {
    try {
      final response = await networkModule.dio
          .post('/authentication/session/new', data: load.toJson());
      // print(response);
      return SessionRequest.fromJson(response.data);
    } on DioError catch (ex) {
      if (ex.response?.statusCode == 401 || ex.response?.statusCode == 404) {
        throw ex.response?.data['status_message'];
      }
      rethrow;
    }
  }
}