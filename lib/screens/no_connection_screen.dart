import 'package:flutter/material.dart';

class NoConnectionScreen extends StatefulWidget {
  const NoConnectionScreen({ Key? key }) : super(key: key);

  @override
  _NoConnectionScreenState createState() => _NoConnectionScreenState();
}

class _NoConnectionScreenState extends State<NoConnectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Padding(padding: EdgeInsets.all(20), child: Column(
          children: [
            Text("Oops! Problème de connexion"),
            Icon(Icons.wifi_off)
          ],
        ),),
      ),
    );
  }
}