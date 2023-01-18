import 'package:connu_app/app/data/providers/api/api_config.dart';

class ApiProvider {
  final HttpManager httpManager = HttpManager();

  Future login({required String email, required String password}) async {
    final result = await httpManager
        .httpRequest(url: '/login', method: HttpMethods.post, body: {
      'email': email,
      'password': password,
    });

    return result;
  }

  Future register({
    String? name,
    String? cpf,
    required String email,
    String? phone,
    required String password,
    required String passwordConfirm,
  }) async {
    final result = await httpManager
        .httpRequest(url: '/register', method: HttpMethods.post, body: {
      'name': name,
      'cpf': cpf,
      'email': email,
      'phone': phone,
      'password': password,
      'password_confirmation': passwordConfirm,
    });

    return result;
  }
}
