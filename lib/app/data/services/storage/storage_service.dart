import 'package:connu_app/app/core/utils/keys.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageService extends GetxService {
  late GetStorage _box;
  Future<StorageService> init() async {
    _box = GetStorage();
    await _box.writeIfNull(userKey, {});
    return this;
  }

  T read<T>(String key) {
    return _box.read(key);
  }

  void write<T>(String key, T value) {
    _box.write(key, value);
  }
}
