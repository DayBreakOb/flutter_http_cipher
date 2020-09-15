import 'dart:math';

import 'package:flutter/material.dart';


const KprimaryLightColor = Color(0xFF6F35A5);

const KprimaryColor = Color(0xFFF1E6FF);
const kLoginColor = Color(0xFF0a80ff);
const KbuttonColor = Color(0xFF15DAE3);
const KinputColor = Color(0xFF72EEF3);
const String loginRsaPub1024Key = "assets/certs/private_rsa_1024.pem";
dynamic backgroudImagelist = [
  'assets/images/bg.jpg',
  'assets/images/bg2.jpg',
  'assets/images/bg3.jpg',
  'assets/images/bg3.png',
  'assets/images/bg4.jpg',
  'assets/images/bg5.jpg',
  'assets/images/bg8.jpg',
  'assets/images/bg9.jpg',
  'assets/images/bg10.jpg',
  'assets/images/bg11.jpg',
  'assets/images/bg12.jpg',
  'assets/images/bg13.jpg',
];




var _random = Random();

var imageToshow = backgroudImagelist[
    _random.nextInt(_currentmillseconds % backgroudImagelist.length)];

var _currentmillseconds = DateTime.now().millisecondsSinceEpoch;
