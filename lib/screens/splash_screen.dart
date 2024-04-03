// ignore_for_file: use_super_parameters

import 'package:clickchap_new/components/buttons.dart';
import 'package:clickchap_new/constants/colors.dart';
import 'package:clickchap_new/screens/signup_screen.dart';
import 'package:clickchap_new/services/page_navigation.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: splashColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(radius: 40, backgroundColor: primaryColor,),
            const Text(
              'S P L A S H S C R E E N',
              style:TextStyle(
                color: primaryColor,
                fontStyle: FontStyle.normal,
                fontSize: 20
              ),
            ),
            SizedBox(height: 100,),
            button('Go', const Icon(Icons.start, color: secondaryColor,), primaryColor, secondaryColor,() {
              navigateToR(context, SignupScreen());
             })
          ],
        ),
      ),
    );
  }
}
