// import 'package:demo1/login/session.dart';
import 'package:demo1/auth/data/session.dart';
import 'package:demo1/auth/data/session_request.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../core/network/networking.dart';

@lazySingleton
class SessionTokenApi {
  //final NetworkModule networkModule;

  final Dio dio;
  SessionTokenApi(this.dio);

  Future<SessionRequest> newSession(final SessionLoad load) async {
    try {
      final response =
          await dio.post('/authentication/session/new', data: load.toJson());
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
