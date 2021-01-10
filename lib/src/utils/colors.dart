import 'package:flutter/material.dart';

Color hexToColor(String code) {
  if(code=='violet'){
    return Color.fromRGBO(151, 38, 179, 1);
  }else if(code=='red'){
    return Colors.red;
  }else if(code=='aqua'){
    return Color.fromRGBO(21, 237, 201, 1);
  }
  return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}