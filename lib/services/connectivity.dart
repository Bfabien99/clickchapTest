import 'package:clickchap_new/services/page_navigation.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:flutter/material.dart';

Future isConnected(BuildContext context)
async {
  var connectivityRes = await Connectivity().checkConnectivity();
  if(connectivityRes == ConnectivityResult.none){
    navigateTo(context, '/nowifi');
  }
  print(connectivityRes);
}