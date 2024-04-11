import 'package:clickchap_new/components/my_routes.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main()
async {
  // Initialisations de Hive
  await Hive.initFlutter();

  // Création d'un conteneur(storage)
  var localStorage = await Hive.openBox('localStorage');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: myRoutes,
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