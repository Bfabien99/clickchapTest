import 'package:clickchap_new/constants/colors.dart';
import 'package:flutter/material.dart';

appBar(String title){
  return AppBar(
    title: Text(title, style: TextStyle(color: logoBgColor, fontWeight: FontWeight.bold),),
    centerTitle: true,
    backgroundColor: bgColor,
    elevation: 4,
    iconTheme: const IconThemeData(color: svgBgColor),
  );
}