import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/widgets.dart';
import 'package:flutter_http_cipher/cipher3/crypto_utils.dart';
import 'package:flutter_http_cipher/cipher3/ras_util.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pointycastle/export.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  group('RSA', () {
    test('RSAALGOIRTHM', () async {
      final text =
          "i have a big suprise for you 24gwaffdssfesg3wgrgtwegrfsgfdsggds^*%*(^&*()%^&*(";
     final securerandom = RsaUtil.exampleSecureRandom();
     print(securerandom);
      final pair =RsaUtil.generateRSAkeyPair(securerandom);
      final public = pair.publicKey;
      final private = pair.privateKey;
      Uint8List signbytes=RsaUtil.rsaSign(private, CryptoUtil.utf8Str2Bytes(text).bytes);
      bool reuslt=RsaUtil.rsaVerify(public, CryptoUtil.utf8Str2Bytes(text).bytes, signbytes);
      assert(true == reuslt);
      print(reuslt);




      final publick = RSAKeyParser.parse( File('test/rsa_publick_key.pem').readAsStringSync()) as RSAPublicKey;
      final privatekey = RSAKeyParser.parse(File('assets/certs/rsa_private_key_pkcs8.pem').readAsStringSync()) as RSAPrivateKey;
      Uint8List signbytes1=RsaUtil.rsaSign(privatekey, CryptoUtil.utf8Str2Bytes(text).bytes);
      bool reuslt2=RsaUtil.rsaVerify(publick, CryptoUtil.utf8Str2Bytes(text).bytes, signbytes1);

      assert(true == reuslt2);
      print(reuslt2);
      Uint8List encrybytes=RsaUtil.rsaEncry(privatekey, CryptoUtil.utf8Str2Bytes(text).bytes);
      Uint8List decrybytes=RsaUtil.rsaDecry(publick, encrybytes);

    print(CryptoUtil(decrybytes).str);
    });
  });
}
