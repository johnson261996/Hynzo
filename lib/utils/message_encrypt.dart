import 'package:encrypt/encrypt.dart' as enc;

class MessageEncrypt {
  late String key;

  MessageEncrypt(this.key);

  late var iv;
  late var encryptor;

  MessageEncrypt.initialize(this.key) {
    final subKey = enc.Key.fromUtf8(key.substring(0, 32));
    iv = enc.IV.fromLength(16);
    encryptor = enc.Encrypter(enc.AES(subKey));
  }

  String encrypt(String message) {
    final encrypted = encryptor.encrypt(message, iv: iv);
    return encrypted.base64;
  }

  String decrypt(String encrypted) {
    enc.Encrypted encoded = enc.Encrypted.fromBase64(encrypted);
    return encryptor.decrypt(encoded, iv: iv);
  }
}
