// ignore_for_file: use_super_parameters, library_private_types_in_public_api

import 'package:clickchap_new/components/buttons.dart';
import 'package:clickchap_new/constants/colors.dart';
import 'package:clickchap_new/components/my_snackbar.dart';
import 'package:clickchap_new/services/page_navigation.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  /// INITIALISATION DES VARIABLES DU FORMULAIRES
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final cpassword = TextEditingController();
  final phone = TextEditingController();
  String gender = 'H';

  /// INITIALISATION DE LA VARIABLE POUR VOIR
  bool isVisible = false;

  /// INITIALISATION DE LA VARIABLE POUR LE CIRCULARPROGRESS
  bool isSubmitted = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        // ignore: sized_box_for_whitespace
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 40,
                  ),

                  const Text(
                    'SignUp',
                    style: TextStyle(fontSize: 25),
                  ),

                  ///> FORM FIELD
                  Form(
                    child: Column(
                      children: [
                        TextFormField(
                          style: const TextStyle(color: primaryColor),
                          controller: name,
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                            icon: Icon(
                                color: primaryColor, Icons.list_alt_rounded),
                            contentPadding: EdgeInsets.all(5),
                            label: Text(
                              'Nom & Prenoms',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ),
                        TextFormField(
                          style: const TextStyle(color: primaryColor),
                          controller: email,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            icon:
                                Icon(color: primaryColor, Icons.email_rounded),
                            contentPadding: EdgeInsets.all(5),
                            label: Text(
                              'Adresse Email',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ),
                        TextFormField(
                          style: const TextStyle(color: primaryColor),
                          obscureText: isVisible,
                          controller: password,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isVisible = !isVisible;
                                  });
                                },
                                icon: !isVisible
                                    ? const Icon(Icons.visibility)
                                    : const Icon(Icons.visibility_off)),
                            icon: const Icon(color: primaryColor, Icons.lock),
                            contentPadding: const EdgeInsets.all(5),
                            label: const Text(
                              'Mot de Passe',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ),
                        TextFormField(
                          style: const TextStyle(color: primaryColor),
                          obscureText: isVisible,
                          controller: cpassword,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: const InputDecoration(
                            icon: Icon(
                                color: primaryColor, Icons.password_rounded),
                            contentPadding: EdgeInsets.all(5),
                            label: Text(
                              'Confirmer Mot de Passe',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ),
                        TextFormField(
                          style: const TextStyle(color: primaryColor),
                          controller: phone,
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            icon:
                                Icon(color: primaryColor, Icons.phone_rounded),
                            contentPadding: EdgeInsets.all(5),
                            label: Text(
                              'Numéro Téléphone',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  ///< FORM FIELD END

                  const SizedBox(height: 10),

                  ///> RADIO BUTTON
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Icon(color: primaryColor, Icons.person_2_rounded),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Genre / Sexe',
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 30,
                          ),
                          Radio(
                            value: 'H',
                            groupValue: gender,
                            onChanged: (value) {
                              setState(() {
                                gender = value!;
                              });
                            },
                          ),
                          
                          Text('Homme', style: TextStyle(
                            color: (gender == 'H') ? primaryColor : secondaryColor
                          ),),
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 30,
                          ),
                          Radio(
                            value: 'F',
                            groupValue: gender,
                            onChanged: (value) {
                              setState(() {
                                gender = value!;
                              });
                            },
                          ),
                          
                          Text('Femme', style: TextStyle(
                            color: (gender == 'F') ? primaryColor : secondaryColor
                          ),),
                        ],
                      ),
                    ],

                    ///< RADIO BUTTON FIN
                  ),
                  isSubmitted
                      ? const CircularProgressIndicator(
                          backgroundColor: primaryColor,
                          color: secondaryColor,
                        )
                      : button(
                          'Valider',
                          const Icon(Icons.arrow_forward_rounded),
                          primaryColor,
                          secondaryColor,
                          validateForm),
                Row(children: [
                    Text('Déjà un compte? '),
                    InkWell(
                      child: Text("Connectez vous!"),
                      onTap: () => navigateTo(context, '/login') ,
                    )
                  ],),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// MES FONCTIONS
  // SOUMETTRE LE FORMULAIRE
  void validateForm() {
    setState(() {
      isSubmitted = true;
    });
    String sName = name.text;
    String sEmail = email.text;
    String sPassword = password.text;
    String sCPassword = cpassword.text;
    String sPhone = phone.text;
    String sGender = gender;

    /// VERIFICATION DES INFORMATIONS RECUES
    if (isEmptyStr(sName) ||
        isEmptyStr(sEmail) ||
        isEmptyStr(sPassword) ||
        isEmptyStr(sPhone) ||
        isEmptyStr(sGender)) {
      showErrorMessage(context, "Tous les champs doivent être remplis!");
      setState(() {
        isSubmitted = false;
      });
      return;
    }

    /// VERIFIER SI LES MOTS DE PASSE CORRESPONDENT
    if(sPassword != sCPassword){
      showErrorMessage(context, "Le mot de passe ne correspond pas!");
      setState(() {
        isSubmitted = false;
      });
      return;
    }

    /// QUAND TOUT EST BON
    name.clear();
    email.clear();
    password.clear();
    cpassword.clear();
    phone.clear();

    showSuccessMessage(context, "Tous les champs sont valide!");
    setState(() {
      isSubmitted = false;
    });
    navigateToR(context, '/login');
    // REDIRIGER VERS LA PAGE DE LOGIN
    return;
  }

  // VERIFIER SI LA VARIABLE N'EST PAS VIDE
  bool isEmptyStr(String data) {
    return data.trim().isEmpty;
  }
}
