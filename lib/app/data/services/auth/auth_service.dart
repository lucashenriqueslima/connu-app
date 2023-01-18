import 'package:connu_app/app/data/services/auth/auth_repository.dart';
import 'package:get/get.dart';

import '../../models/user.dart';

class AuthService extends GetxService {
  final AuthRepository _authRepository = AuthRepository();
  Rx<User> user = const User().obs;

  Future<AuthService> init() async {
    return this;
  }

  login({required email, required password}) =>
      _authRepository.login(email: email, password: password);

  register({
    String? name,
    String? cpf,
    required email,
    String? phone,
    required password,
    required passwordConfirm,
  }) =>
      _authRepository.register(
        name: name,
        cpf: cpf,
        email: email,
        phone: phone,
        password: password,
        passwordConfirm: passwordConfirm,
      );

  void setUser({
    required int idUser,
    String? name,
    String? cpf,
    required String email,
    String? phone,
    required String token,
  }) {
    user(
      User(
        idUser: idUser,
        name: name,
        cpf: cpf,
        email: email,
        phone: phone,
        token: token,
      ),
    );
  }

  User readUser() => _authRepository.readUser();

  void writeUser(User user) => _authRepository.writeUser(user);
}
