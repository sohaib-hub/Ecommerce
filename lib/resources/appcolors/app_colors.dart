import 'dart:ui';

import 'package:flutter/material.dart';

class Appcolors {
  static Color primary = fromHex('6E93C4');
  //static Color primary = fromHex('#EB5757');

  static Color primaryDark = fromHex('6E93C4 ');

  static Color secondary = fromHex('6E93C4 ');

  static Color secondaryLight = fromHex('6E93C4 ');

  static Color secondaryDark = fromHex('6E93C4 ');

  static Color text1 = fromHex('#212121');

  static Color text2 = fromHex('#757575');

  static Color divider = fromHex('#BDBDBD');

  static Color black9007f = fromHex('#7f000000');

  static Color gray600 = fromHex('#828282');

  static Color redA200 = fromHex('#ff655b');

  static Color gray800 = fromHex('#4f4f4f');

  static Color gray = Colors.grey;
  static Color green = Colors.green;

  static Color gray100 = fromHex('#f2f2f2');

  static Color bluegray700 = fromHex('#355c7d');

  static Color black900Cc = fromHex('#cc000000');

  static Color black900 = fromHex('#000000');

  static Color bluegray400 = fromHex('#888888');

  static Color black90028 = fromHex('#28000000');

  static Color pink300 = fromHex('#f15a87');

  static Color black90014 = fromHex('#14000000');

  static Color whiteA700 = fromHex('#ffffff');


  static Color greenAccent =Colors.greenAccent;
  static Color black =Colors.black;
  static Color red =Colors.red;
  static Color blue =Colors.blue;
  static Color yellow =Colors.yellow;


  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
