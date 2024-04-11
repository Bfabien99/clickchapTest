// ignore_for_file: use_super_parameters

import 'dart:async';

import 'package:clickchap_new/components/buttons.dart';
import 'package:clickchap_new/constants/colors.dart';
import 'package:clickchap_new/services/connectivity.dart';
import 'package:clickchap_new/services/hive_services.dart';
import 'package:clickchap_new/services/page_navigation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  /// INITIALISATION DE HIVE
  final localStorage = Hive.box('localStorage');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //isConnected(context);
    Timer(const Duration(seconds: 3), () {
      Map isUser = getUserData(localStorage);
      if (isUser.isNotEmpty) {
        navigateToR(context, '/dashboard');
      } else {
        navigateToR(context, '/login');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: bgColor,
        ),
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage('assets/logo1.png'),
                radius: 80,
                backgroundColor: logoBgColor,
              ),
              const Text(
                'C L I C K C H A P',
                style: TextStyle(
                    color: primaryColor,
                    fontStyle: FontStyle.normal,
                    fontSize: 20),
              ),
              // SizedBox(height: 100,),
              // button('Go', const Icon(Icons.start, color: secondaryColor,), primaryColor, secondaryColor,() {
              //   navigateToR(context, '/login');
              //  })
            ],
          ),
        ),
      ),
    );
  }
}
