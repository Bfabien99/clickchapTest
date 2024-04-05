import 'package:clickchap_new/screens/user/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home : HomeScreen()
    );
  }
}

//// Première Etape
/// Authentification
// Onboarding à la connexion passant par la création de compte
// On se connecte par email et mot de passe

//// Deuxième Etape
/// Comment acheter un produit
// Recherche du marchand par son nom ou son addresse
// On voir les différentes activités fournies par le marchand
// On voir les différentes categories de l'activité choisie
// On voir les produits liés à la categorie choisie
// Au clique un modal s'affiche pour renseigner le prix
// Un ticket pour chaque activité

//// Troisième Etape
/// Payement