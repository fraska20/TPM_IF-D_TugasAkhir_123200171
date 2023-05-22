import 'dart:convert';
import 'package:encrypt/encrypt.dart';

class HiveEncryptionHelper {
  static final _key =
      Key.fromUtf8('your encryption key'); // Replace with your encryption key
  static final _iv = IV.fromLength(16);

  static final _encrypter = Encrypter(AES(_key, mode: AESMode.cbc));

  static String encrypt(String plaintext) {
    final encrypted = _encrypter.encrypt(plaintext, iv: _iv);
    return base64.encode(encrypted.bytes);
  }

  static String decrypt(String ciphertext) {
    final encrypted = Encrypted.fromBase64(ciphertext);
    final decrypted = _encrypter.decrypt(encrypted, iv: _iv);
    return decrypted;
  }
}
