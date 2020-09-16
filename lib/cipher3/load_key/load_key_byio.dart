
import 'package:flutter/services.dart';
import 'package:pointycastle/asymmetric/api.dart';

import '../ras_util.dart';

Future<T> loadKeyFromFIle<T extends RSAAsymmetricKey> (String filepath) async{
  String key=await rootBundle.loadString(filepath);
  //final file   =File(filepath);
  //final  key  = await file.readAsString();
  print(key);
  return RSAKeyParser.parse(key);
}