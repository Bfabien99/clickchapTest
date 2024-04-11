// ignore_for_file: use_super_parameters, library_private_types_in_public_api

import 'package:clickchap_new/components/appBar.dart';
import 'package:clickchap_new/components/drawer.dart';
import 'package:clickchap_new/constants/colors.dart';
import 'package:clickchap_new/services/connectivity.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({ Key? key }) : super(key: key);

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //isConnected(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar('H I S T O R I Q U E S', secondaryColor, primaryColor),
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