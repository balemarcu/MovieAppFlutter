import 'package:mobx/mobx.dart';

import '../helpers/resource.dart';
import 'login_repository.dart';

part 'login_view_model.g.dart';

class LoginViewModel = LoginViewModelBase with _$LoginViewModel;

abstract class LoginViewModelBase with Store {
  late final LoginRepository repository;

  LoginViewModelBase() {
    repository = LoginRepository();
  }

  @computed
  bool get succesLogin => repository.isLoggedIn;

  @observable
  bool isLoading = false;

  @observable
  String? error;

  @observable
  Resource<bool> login = const Resource.initial();

  Future<void> logIn(String username, String password) async {
    login = const Resource.loading();
    try {
      login = Resource.success(
          data: (await repository.login(
        username,
        password,
      )));
    } catch (ex) {
      login = Resource.error(error: ex.toString());
    }
  }
}
