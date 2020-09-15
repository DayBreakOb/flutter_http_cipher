import 'dart:typed_data';

import 'package:pointycastle/api.dart';
import 'package:pointycastle/export.dart';

import 'crypto_utils.dart';

class AesUtil {
  Uint8List aesCbcEncry(Uint8List encrypted1, String aesKey, String aesIv) {
    if (aesKey == null || aesKey.length == 0 || aesKey.length != 32) {
      throw ("aes key must be length(32)");
    }
    try {
      BlockCipher aesCbc = CBCBlockCipher(AESFastEngine());
      Uint8List keybytes = CryptoUtil.utf8Str2Bytes(aesKey).bytes;
      KeyParameter key = KeyParameter(keybytes);
      Uint8List ivbytes = CryptoUtil.utf8Str2Bytes(aesIv).bytes;
      ParametersWithIV kiv = ParametersWithIV(key, ivbytes);
      int plaintextLength = encrypted1.length;
      int blockSize = aesCbc.blockSize;
      if (plaintextLength % blockSize != 0) {
        plaintextLength =
            plaintextLength + (blockSize - (plaintextLength % blockSize));
      }
      final paddedPlaintext = Uint8List(plaintextLength);
      List.copyRange(paddedPlaintext, 0, encrypted1);
      final cipherText = Uint8List(plaintextLength);
      aesCbc.init(true, kiv);
      var offset = 0;
      while (offset < cipherText.length) {
        offset +=
            aesCbc.processBlock(paddedPlaintext, offset, cipherText, offset);
      }
      assert(offset == cipherText.length);
      return cipherText;
    } catch (e) {
      throw ("aesencry发生错误" + e.toString());
    }
  }

  Uint8List aesCbcDecry(Uint8List encrypted1, String aesKey, String aesIv) {
    if (aesKey == null || aesKey.length == 0 || aesKey.length != 32) {
      throw ("aes key must be length(32)");
    }
    try {
      BlockCipher aesCbc = CBCBlockCipher(AESFastEngine());
      Uint8List keybytes = CryptoUtil.utf8Str2Bytes(aesKey).bytes;
      KeyParameter key = KeyParameter(keybytes);
      Uint8List ivbytes = CryptoUtil.utf8Str2Bytes(aesIv).bytes;
      ParametersWithIV kiv = ParametersWithIV(key, ivbytes);
      int cipherTextLength = encrypted1.length;
      int blockSize = aesCbc.blockSize;
      if (cipherTextLength % blockSize != 0) {
        cipherTextLength =
            cipherTextLength + (blockSize - (cipherTextLength % blockSize));
      }
      final cipherText = Uint8List(cipherTextLength);
      List.copyRange(cipherText, 0, encrypted1);
      final paddedPlaintext = Uint8List(cipherTextLength);
      aesCbc.init(false, kiv);
      var offset = 0;
      while (offset < paddedPlaintext.length) {
        offset +=
            aesCbc.processBlock(cipherText, offset, paddedPlaintext, offset);
      }
      assert(offset == cipherText.length);
      return paddedPlaintext;
    } catch (e) {
      throw ("aes解密发生错误" + e.toString());
    }
  }
}
