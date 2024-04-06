// ignore_for_file: use_super_parameters, library_private_types_in_public_api

import 'package:clickchap_new/components/appBar.dart';
import 'package:clickchap_new/components/drawer.dart';
import 'package:clickchap_new/constants/colors.dart';
import 'package:flutter/material.dart';

class MerchantScreen extends StatefulWidget {
  const MerchantScreen({ Key? key }) : super(key: key);

  @override
  _MerchantScreenState createState() => _MerchantScreenState();
}

class _MerchantScreenState extends State<MerchantScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar('M A R C H A N D S', secondaryColor, primarySoftColor),
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