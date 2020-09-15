import 'dart:typed_data';

import 'package:flutter_http_cipher/cipher3/aes_util.dart';
import 'package:flutter_http_cipher/cipher3/crypto_utils.dart';
import 'package:flutter_test/flutter_test.dart';

import '../lib/cipher3/random_str.dart';

void main() {
  group('AES', () {
    test('AESENCRY', () {
      final text =
          "i have a big suprise for you 24gwaffdssfesg3wgrgtwegrfsgfdsggds^*%*(^&*()%^&*(";
      int ss = DateTime.now().millisecondsSinceEpoch;
      String cc = RandomPasswd().getRandom1(4, 19);
      String key = ss.toString() + cc;
      String iv = RandomPasswd().getRandom1(4, 3) + ss.toString();
      print(iv);

      Uint8List bytes = CryptoUtil.utf8Str2Bytes(text).bytes;
      Uint8List str = AesUtil().aesCbcEncry(bytes, key, iv);
      String base64 = CryptoUtil(str).base64;
      Uint8List bytes1 = CryptoUtil.base64Str2Bytes(base64).bytes;
      String hex16str = CryptoUtil(str).hex16;
      Uint8List bytes3 = CryptoUtil.hex16ToBytes(hex16str).bytes;
      Uint8List sss1 = AesUtil().aesCbcDecry(bytes3, key, iv);
      Uint8List sss = AesUtil().aesCbcDecry(bytes1, key, iv);
      var cca = CryptoUtil(sss).str;
      var cca2 = CryptoUtil(sss1).str;
      print(cca);
      print(cca2);
    });
  });
}
