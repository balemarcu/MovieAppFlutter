class LoginPayload {
  String username;
  String password;
  String requestToken;

  LoginPayload(
      {required this.username,
      required this.password,
      required this.requestToken});
}
