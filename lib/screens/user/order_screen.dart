// ignore_for_file: use_super_parameters, library_private_types_in_public_api

import 'package:clickchap_new/components/appBar.dart';
import 'package:clickchap_new/components/drawer.dart';
import 'package:clickchap_new/constants/colors.dart';
import 'package:clickchap_new/services/connectivity.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({ Key? key }) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {

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
        appBar: appBar('C O M M A N D E S'),
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