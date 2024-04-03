import 'package:clickchap_new/constants/colors.dart';
import 'package:flutter/material.dart';

button(String label, Icon icon, Color buttonColor, Color textColor,
    void Function()? onPressed) {
  return ElevatedButton.icon(
      onPressed: onPressed,
      icon: icon,
      label: Text(
        label,
        textAlign: TextAlign.center,
        style: TextStyle(color: textColor),
      ));
}
