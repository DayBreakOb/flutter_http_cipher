import 'dart:convert' as convert;

import 'dart:typed_data';

class CryptoUtil {
  //java byte[]
  final Uint8List _bytes;

  CryptoUtil(this._bytes);

  CryptoUtil.base64Str2Bytes(String encode) : _bytes = convert.base64.decode(encode);

  CryptoUtil.hex16ToBytes(String encode)
      : _bytes = Uint8List.fromList(List.generate(
                encode.length,
                (index) =>
                    index % 2 == 0 ? encode.substring(index, index + 2) : null)
            .where((element) => element != null)
            .map((e) => int.parse(e, radix: 16))
            .toList());

  CryptoUtil.utf8Str2Bytes(String str)
      : _bytes = Uint8List.fromList(convert.utf8.encode(str));

  CryptoUtil.createEmptyBytes(int length) : _bytes = Uint8List(length);

  Uint8List get bytes {
    return _bytes;
  }

  String get hex16 {
    return _bytes.map((e) => e.toRadixString(16).padLeft(2, '0')).join();
  }

  String get base64{
    return convert.base64.encode(_bytes);
  }

  String get str{
    return convert.utf8.decode(_bytes);
  }

}


