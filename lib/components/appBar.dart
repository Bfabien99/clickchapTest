import 'package:clickchap_new/constants/colors.dart';
import 'package:flutter/material.dart';

appBar(String title, Color backgroundColor, Color textColor){
  return AppBar(
    title: Text(title, style: TextStyle(color: textColor, fontWeight: FontWeight.bold),),
    centerTitle: true,
    backgroundColor: Colors.red,
    elevation: 4,
    iconTheme: const IconThemeData(color: Colors.white),
  );
}