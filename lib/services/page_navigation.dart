import 'package:flutter/material.dart';

// Navigation avec un remplacement d'écran, pas de retour en arrière
navigateToR(BuildContext context, widget){
  final route = MaterialPageRoute(builder: (context) => widget);
    Navigator.pushReplacement(context, route);
}

// Navigation avec supperposition d'écran, retour en arrière possible
navigateTo(BuildContext context, widget){
  final route = MaterialPageRoute(builder: (context) => widget);
    Navigator.push(context, route);
}