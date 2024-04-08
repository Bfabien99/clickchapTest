import 'package:clickchap_new/screens/login_screen.dart';
import 'package:clickchap_new/screens/signup_screen.dart';
import 'package:clickchap_new/screens/splash_screen.dart';
import 'package:clickchap_new/screens/user/about_screen.dart';
import 'package:clickchap_new/screens/user/account_screen.dart';
import 'package:clickchap_new/screens/user/history_screen.dart';
import 'package:clickchap_new/screens/user/home_screen.dart';
import 'package:clickchap_new/screens/user/merchant_screen.dart';
import 'package:clickchap_new/screens/user/order_screen.dart';
import 'package:clickchap_new/screens/user/profil_screen.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> myRoutes = 
{
  '/home' : (context) => SplashScreen(),
  '/login' : (context) => LoginScreen(),
  '/signup' : (context) => SignupScreen(),
  '/dashboard' : (context) => HomeScreen(),
  '/history' : (context) => HistoryScreen(),
  '/orders' : (context) => OrderScreen(),
  '/merchants' : (context) => MerchantScreen(),
  '/profil' : (context) => ProfilScreen(),
  '/account' : (context) => AccountScreen(),
  '/about' : (context) => AboutScreen(),
  '/nowifi' : (context) => AboutScreen(),
};