import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_weather/utilities/enkripsi.dart';

class HiveBoxex {
  static String pengguna = 'pengguna_box';

  Future<void> putData(String key, String value) async {
    final encryptedValue = HiveEncryptionHelper.encrypt(value);
    final box = await Hive.openBox(pengguna);
    await box.put(key, encryptedValue);
    await box.close();
  }

  Future<String> getData(String key) async {
    final box = await Hive.openBox(pengguna);
    final encryptedValue = box.get(key) as String;
    final decryptedValue = HiveEncryptionHelper.decrypt(encryptedValue);
    await box.close();
    return decryptedValue;
  }
}
