import 'package:clickchap_new/components/buttons.dart';
import 'package:clickchap_new/components/my_snackbar.dart';
import 'package:clickchap_new/constants/colors.dart';
import 'package:clickchap_new/services/api_call.dart';
import 'package:clickchap_new/services/hive_services.dart';
import 'package:clickchap_new/services/page_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:hive/hive.dart';

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

  /// INITIALISATION DE HIVE
  final localStorage = Hive.box('localStorage');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            image: DecorationImage(
              repeat: ImageRepeat.repeat,
              opacity: 1,
              image: Svg(
                'assets/i-like-food.svg',
                size: Size(10, 10),
              ),
              colorFilter: ColorFilter.mode(
                svgBgColor,
                BlendMode.srcIn,
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage('assets/logo1.png'),
                backgroundColor: logoBgColor,
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
                        icon: Icon(color: primaryColor, Icons.email_rounded),
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
                            icon: isVisible
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
              SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Vous n'avez pas de compte? "),
                  InkWell(
                    child: Text("Incrivez vous!"),
                    onTap: () => navigateTo(context, '/signup'),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// MES FONCTIONS
  /// SOUMETTRE LE FORMULAIRE
  void validateForm() async {
    setState(() {
      isSubmitted = true;
    });
    String sEmail = email.text;
    String sPassword = password.text;

    // VERIFICATION DES INFORMATIONS RECUES
    if (isEmptyStr(sEmail) || isEmptyStr(sPassword)) {
      showErrorMessage(context, "Tous les champs doivent être remplis!");
      setState(() {
        isSubmitted = false;
      });
      return;
    }

    // APPEL à L'API
    Map body = {
      'email': sEmail,
      'password': sPassword,
    };

    Map result = await apiLoginUser(body);
    if (result.containsKey('type')) {
      setState(() {
        isSubmitted = false;
      });
      showErrorMessage(context, result['message']);
      //socket Error
      if (result['type'] == 1) {
        return;
      }
      //client Error
      if (result['type'] == 2) {
        return;
      }
      //other Error
      if (result['type'] == 3) {
        return;
      }
    }

    if (result.containsKey('status')) {
      setState(() {
        isSubmitted = false;
      });
      if (result['status'] == false) {
        showErrorMessage(context, result['message']);
      } else {
        // QUAND TOUT EST BON
        email.clear();
        password.clear();
        saveUserData(localStorage, result['message']['token'],
            result['message']['user']);
        // REDIRIGER VERS LA PAGE DE LOGIN
        navigateToR(context, '/dashboard');
      }
    }
  }

  /// VERIFIER SI LA VARIABLE N'EST PAS VIDE
  bool isEmptyStr(String data) {
    return data.trim().isEmpty;
  }
}
