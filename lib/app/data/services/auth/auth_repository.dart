import 'package:connu_app/app/data/providers/api/api.dart';
import 'package:connu_app/app/data/providers/storage/storage.dart';
import '../../models/user.dart';

class AuthRepository {
  final StorageProvider storageProvider = StorageProvider();
  final ApiProvider apiProvider = ApiProvider();

  login({required email, required password}) =>
      apiProvider.login(email: email, password: password);

  register({
    String? name,
    String? cpf,
    required email,
    String? phone,
    required password,
    required passwordConfirm,
  }) =>
      apiProvider.register(
        name: name,
        cpf: cpf,
        email: email,
        phone: phone,
        password: password,
        passwordConfirm: passwordConfirm,
      );

  User readUser() => storageProvider.readUser();

  void writeUser(User user) => storageProvider.writeUser(user);
}
