import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

signupForm(TextEditingController email,
    TextEditingController password) {
  return Form(
    child: Column(
      children: [
        TextFormField(
          controller: email,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            icon: Icon(Icons.email_rounded),
            contentPadding: EdgeInsets.all(5),
            label: Text(
              'Adresse Email',
              style: TextStyle(fontSize: 15),
            ),
          ),
        ),
        TextFormField(
          controller: password,
          keyboardType: TextInputType.visiblePassword,
          decoration: const InputDecoration(
            icon: Icon(Icons.password_rounded),
            contentPadding: EdgeInsets.all(5),
            label: Text(
              'Mot de Passe',
              style: TextStyle(fontSize: 15),
            ),
          ),
        ),
      ],
    ),
  );
}
