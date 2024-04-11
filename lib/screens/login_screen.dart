import 'package:clickchap_new/components/buttons.dart';
import 'package:clickchap_new/components/my_snackbar.dart';
import 'package:clickchap_new/constants/colors.dart';
import 'package:clickchap_new/services/page_navigation.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  /// INITIALISATION DES VARIABLES DU FORMULAIRES
  final email = TextEditingController();
  final password = TextEditingController();

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
        body: Center(
          child: SizedBox(
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
                      'LogIn',
                      style: TextStyle(fontSize: 25),
                    ),

                    ///> FORM FIELD
                    Form(
                      child: Column(
                        children: [
                          TextFormField(
                            style: const TextStyle(color: primaryColor),
                            controller: email,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              icon: Icon(
                                  color: primaryColor, Icons.email_rounded),
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
                        ],
                      ),
                    ),

                    ///< FORM FIELD END

                    const SizedBox(height: 10),
                    isSubmitted
                        ? const CircularProgressIndicator(
                            backgroundColor: primaryColor,
                            color: secondaryColor,
                          )
                        : button('Connexion', const Icon(Icons.login_outlined),
                            primaryColor, secondaryColor, validateForm),
                  Row(children: [
                    Text('Pas de compte? '),
                    InkWell(
                      child: Text("Incrivez vous!"),
                      onTap: ()=> navigateTo(context, '/signup') ,
                    )
                  ],),
                  ],
                ),
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
    String sEmail = email.text;
    String sPassword = password.text;

    /// VERIFICATION DES INFORMATIONS RECUES
    if (isEmptyStr(sEmail) || isEmptyStr(sPassword)) {
      showErrorMessage(context, "Tous les champs doivent être remplis!");
      setState(() {
        isSubmitted = false;
      });
      return;
    }

    /// QUAND TOUT EST BON
    email.clear();
    password.clear();

    showSuccessMessage(context, "Tous les champs sont valide!");
    setState(() {
      isSubmitted = false;
    });
    // REDIRIGER VERS LA PAGE DE LOGIN
    navigateToR(context, '/dashboard');
  }

  // VERIFIER SI LA VARIABLE N'EST PAS VIDE
  bool isEmptyStr(String data) {
    return data.trim().isEmpty;
  }
}
