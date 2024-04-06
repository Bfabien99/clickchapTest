import 'package:flutter/material.dart';

// Navigation avec un remplacement d'écran, pas de retour en arrière
navigateToR(BuildContext context, String route){
    Navigator.pushReplacementNamed(context, route);
}

// Navigation avec supperposition d'écran, retour en arrière possible
navigateTo(BuildContext context, String route)
{
    Navigator.pushNamed(context, route);
}