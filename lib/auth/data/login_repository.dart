/*import 'package:demo1/login/session.dart';
import 'package:demo1/login/session_token_api.dart';
import 'package:demo1/login/token_request.dart';*/
import 'package:demo1/auth/data/session.dart';
import 'package:demo1/auth/data/session_token_api.dart';
import 'package:demo1/auth/data/token_request.dart';
import 'package:demo1/main.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/storage/storage_module.dart';
import 'get_request_token_api.dart';
import 'login_api_request.dart';
import 'login_payload.dart';
// import '../../login/login_api_request.dart';
// import '../../login/login_payload.dart';

part 'login_repository.g.dart';

@lazySingleton
class LoginRepository extends _LoginRepository with _$LoginRepository {
  LoginRepository(
      final LoginApi loginApi,
      final GetRequestTokenApi getRequestTokenApi,
      final SessionTokenApi sessionTokenApi,
      final SharedPreferences sharedPreferences)
      : super(loginApi, getRequestTokenApi, sessionTokenApi, sharedPreferences);
}

const String requestToken = 'requestToken';
const String expiresTokenAt = 'expiredTokenAt';
const String sesionToken = 'sesionToken';
const String expireSessionToken = 'expireSessionToken';
const String sessionId = 'sessionId';

abstract class _LoginRepository with Store {
  _LoginRepository(this.loginApi, this.getRequestTokenApi, this.newSessionToken,
      this.sharedPreferences) {
    checkAuth();
  }

  @observable
  bool isLoggedIn = false;

  final LoginApi loginApi;
  final GetRequestTokenApi getRequestTokenApi;
  final SessionTokenApi newSessionToken;
  final SharedPreferences sharedPreferences;

  Future<bool> login(String username, String password) async {
    try {
      final TokenRequest token = await getRequestTokenApi.getRequestToken();
      print(token.toString());

      await sharedPreferences.setString(requestToken, token.value);
      await sharedPreferences.setString(
          expiresTokenAt, token.expiresAt.toIso8601String());

      final sessionToken = await loginApi.login(LoginPayload(
          username: username, password: password, requestToken: token.value));

      final session = await newSessionToken
          .newSession(SessionLoad(requestToken: sessionToken.value));

      await sharedPreferences.setString(sessionId, session.value);

      //checkAuth();
      isLoggedIn = true;
      return true;
    } catch (ex) {
      // print(ex);
      return false;
    }
  }

  Future<bool> checkAuth() async {
    final String? token = sharedPreferences.getString(requestToken);

    if (token == null) return false;

    final String? tokenExpiredString =
        sharedPreferences.getString(expiresTokenAt);

    if (tokenExpiredString == null) return false;

    final DateTime tokenExpiredDate = DateTime.parse(tokenExpiredString);
    final DateTime now = DateTime.now().toUtc();

    final Duration diff = tokenExpiredDate.difference(now);

    if (diff.inMilliseconds <= 0) {
      sharedPreferences.remove(requestToken);
      sharedPreferences.remove(tokenExpiredString);
      isLoggedIn = false;
      return false;
    }
    isLoggedIn = true;
    return true;
  }
}
