import 'package:clickchap_new/components/appBar.dart';
import 'package:clickchap_new/components/drawer.dart';
import 'package:clickchap_new/constants/colors.dart';
import 'package:flutter/material.dart';

class NoConnectionScreen extends StatefulWidget {
  const NoConnectionScreen({ Key? key }) : super(key: key);

  @override
  _NoConnectionScreenState createState() => _NoConnectionScreenState();
}

class _NoConnectionScreenState extends State<NoConnectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('No Internet', primaryColor, secondaryColor),
      drawer: drawer(context),
    );
  }
}