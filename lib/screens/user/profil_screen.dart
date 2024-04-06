// ignore_for_file: use_super_parameters, library_private_types_in_public_api

import 'package:clickchap_new/components/appBar.dart';
import 'package:clickchap_new/components/drawer.dart';
import 'package:clickchap_new/constants/colors.dart';
import 'package:flutter/material.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({ Key? key }) : super(key: key);

  @override
  _ProfilScreenState createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar('P R O F I L', secondaryColor, primarySoftColor),
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