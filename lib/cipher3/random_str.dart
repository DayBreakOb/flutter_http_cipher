import 'dart:math';

class RandomPasswd {
  var randomMax = 100000000;
  var index = 1;
  var numberOfLetter = 26;
  var numberIndex = 48;
  var numberMax = 9;
  var capitalIndex = 65;
  var lowerCaseIndex = 97;
  var special = 0;
  var specialCharacter = [
    [33, 14],
    [58, 6],
    [91, 5],
    [123, 3]
  ];
  var length = 16;
  var strengthLevel = 4;
  String getRandom() {
    var sb = new StringBuffer();
    if (length <= 0) throw 'length can not <=0';
    for (var i = 0; i < length; i++) {
      var xx = getNextChar();
      sb.write(String.fromCharCodes([xx]));
    }
    return sb.toString();
  }

  String getRandom1(strengthLevel, length) {
    this.strengthLevel = strengthLevel;
    this.length = length;
    return getRandom();
  }

  double random() {
    return Random().nextDouble();
  }

  int getNextChar() {
    if (strengthLevel < 1 || strengthLevel > 4)
      throw 'this level is not suppported';
    // ascii
    var x = 0;
    // 伪字符ascii
    var puppetLetter = ((random() * randomMax).ceil() % numberOfLetter).ceil();
    // 伪数字ascii
    var pupperNumber =
        (random() * randomMax).ceil() % numberIndex + numberIndex;

    var levelIndex = (random() * randomMax).ceil() % strengthLevel;
    // 特殊字符数组一维
    var specialType = (random() * randomMax).ceil() % specialCharacter.length;
    // 特殊字符二维ascii
    var specialInt =
        (random() * randomMax).ceil() % specialCharacter[specialType][index] +
            specialCharacter[specialType][special];

    switch (strengthLevel) {
      case 1:
        x = pupperNumber;
        break;
      case 2:
        if (levelIndex == index)
          x = pupperNumber;
        else
          x = puppetLetter + lowerCaseIndex;
        break;
      case 3:
        if (levelIndex == 0)
          x = pupperNumber;
        else if (levelIndex == index)
          x = puppetLetter + lowerCaseIndex;
        else
          x = puppetLetter + capitalIndex;
        break;
      case 4:
        if (levelIndex == 0)
          x = pupperNumber;
        else if (levelIndex == index)
          x = puppetLetter + lowerCaseIndex;
        else if (levelIndex == index * 2)
          x = puppetLetter + capitalIndex;
        else
          x = specialInt;
        break;
      default:
        break;
    }

    return x;
  }
}
