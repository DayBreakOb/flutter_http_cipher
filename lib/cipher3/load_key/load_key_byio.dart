
import 'package:flutter/services.dart';
import 'package:pointycastle/asymmetric/api.dart';

Future<T> loadKeyFromFIle<T extends RSAAsymmetricKey> (String filepath) async{
  String key=await rootBundle.loadString(filepath);
  //final file   =File(filepath);
  //final  key  = await file.readAsString();
  //final parse = RSAKeyParser();
return null;
}