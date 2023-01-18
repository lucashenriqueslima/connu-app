import 'package:connu_app/app/data/services/storage/storage_service.dart';
import 'package:get/get.dart';
import '../../../core/utils/keys.dart';
import '../../models/user.dart';

class StorageProvider {
  final StorageService _storageService = Get.find<StorageService>();

  User readUser() {
    return User.fromJson(_storageService.read(userKey));
  }

  void writeUser(User user) {
    _storageService.write(userKey, user.toJson());
  }
}
