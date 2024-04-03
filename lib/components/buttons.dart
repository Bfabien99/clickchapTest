import 'package:flutter/material.dart';

button(String label, Icon icon ,void Function()? onPressed){
  return ElevatedButton.icon(onPressed: onPressed, icon: icon, label: Text(label));
}