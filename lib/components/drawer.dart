import 'package:clickchap_new/constants/colors.dart';
import 'package:flutter/material.dart';

drawer(BuildContext context) {
  return Drawer(
    backgroundColor: Colors.grey[100],
    child: ListView(
      children: [
        Container(
          margin: EdgeInsets.only(top: 10),
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: splashColor,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Kaboré Abdoul Mahamoudou", textAlign: TextAlign.center,),
              SizedBox(height: 20,),
              listTileRender(Text('Historiques'), Icon(Icons.history), 18,
                  primaryColor, primaryColor, true, () {}),
              listTileRender(Text('Commandes'), Icon(Icons.shopping_cart_checkout), 18,
                  primaryColor, primaryColor, true, () {}),
              listTileRender(Text('Marchands'), Icon(Icons.sell), 18,
                  primaryColor, primaryColor, false, () {}),
            ],
          ),
        ),
        SizedBox(height: 10,),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: splashColor,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              listTileRender(Text('Profil'), Icon(Icons.person), 18,
                  primaryColor, primaryColor, true, () {}),
              listTileRender(Text('Compte'), Icon(Icons.settings), 18,
                  primaryColor, primaryColor, true, () {}),
              listTileRender(Text('A Propos'), Icon(Icons.help), 18,
                  primaryColor, primaryColor, false, () {}),
            ],
          ),
        ),
        SizedBox(height: 10,),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: splashColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              listTileRender(Text('Deconnecter'), Icon(Icons.logout), 18,
                  primaryColor, primaryColor, true, () {}),
              listTileRender(Text('Laisser un Like'), Icon(Icons.logo_dev), 18,
                  primaryColor, primaryColor, false, () {}),
            ],
          ),
        ),
      ],
    ),
  );
}

listTileRender(Text text, Icon icon, double size, Color iconColor,
    Color textColor, bool? divider, Function? Function() onTap) {
  return Column(
    children: [
      ListTile(
        leading: icon,
        iconColor: Colors.black87,
        textColor: Colors.black87,
        titleTextStyle: TextStyle(fontSize: size, fontWeight: FontWeight.w500),
        title: text,
        onTap: onTap,
      ),
      divider! ? Divider(height: 2, color: Colors.grey[20],) : SizedBox.shrink(),
    ],
  );
}
