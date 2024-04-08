// ignore_for_file: use_super_parameters, library_private_types_in_public_api

import 'package:clickchap_new/components/appBar.dart';
import 'package:clickchap_new/components/drawer.dart';
import 'package:clickchap_new/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:clickchap_new/services/connectivity.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({ Key? key }) : super(key: key);

  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isConnected(context);
  }
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar('A  P R O P O S', secondaryColor, primarySoftColor),
          drawer: drawer(context),
          backgroundColor: Colors.grey[80],
          body: Container(
            child: SingleChildScrollView(
              child: Column(
                
              ),
            ),
          ),
      ),
    );
  }
}