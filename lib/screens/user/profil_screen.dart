// ignore_for_file: use_super_parameters, library_private_types_in_public_api

import 'package:clickchap_new/components/appBar.dart';
import 'package:clickchap_new/components/drawer.dart';
import 'package:clickchap_new/constants/colors.dart';
import 'package:clickchap_new/services/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({Key? key}) : super(key: key);

  @override
  _ProfilScreenState createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //isConnected(context);
  }

  @override
  Widget build(BuildContext context) {
    final localStorage = Hive.box('localStorage');
    final user = localStorage.get('user');

    return SafeArea(
      child: Scaffold(
        appBar: appBar('P R O F I L'),
        drawer: drawer(context),
        backgroundColor: Colors.grey[80],
        body: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(50),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: svgBgColor,
                  radius: 40,
                ),
                SizedBox(
                  height: 40,
                ),
                detailsBox('Nom & Prenoms', user['name']),
                SizedBox(
                  height: 20,
                ),
                detailsBox('Email', user['email']),
                SizedBox(
                  height: 20,
                ),
                detailsBox('Téléphone', user['phone']),
                SizedBox(
                  height: 20,
                ),
                detailsBox('Genre', user['gender'] == 'H' ? 'Homme' : 'Femme'),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

detailsBox(String fieldTitle, String value) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        '$fieldTitle :',
        style: TextStyle(fontSize: 20),
      ),
      Flexible(child: Text(value))
    ],
  );
}
