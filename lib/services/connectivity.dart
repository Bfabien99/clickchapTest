import 'package:clickchap_new/services/page_navigation.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:flutter/material.dart';

isConnected(BuildContext context){

  final listener = InternetConnection().onStatusChange.listen((InternetStatus status) {
  switch (status) {
    case InternetStatus.connected:
      print('connected');
      break;
    case InternetStatus.disconnected:
      navigateTo(context, '/nowifi');
      break;
  }
});
}