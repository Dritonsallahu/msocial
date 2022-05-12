import 'package:encrypt/encrypt.dart' as encrypt;

class EncryptionPassword{

  static final key = encrypt.Key.fromLength(32);
  static final iv = encrypt.IV.fromLength(16);
  static final encrypter = encrypt.Encrypter(encrypt.AES(key));

  static  encryptAes(password)  {
    final encrypted = encrypter.encrypt(password,iv: iv);
    return encrypted;
  }

  static decryptAes(password) {
    return  encrypter.decrypt(password,iv: iv);
  }

  saveKeyInMemory(key){

  }

}