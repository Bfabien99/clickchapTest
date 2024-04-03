import 'package:flutter/material.dart';

  showErrorMessage(BuildContext context, String message) {
    final snackBar = SnackBar(
      duration: const Duration(seconds: 3),
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  showSuccessMessage(BuildContext context, String message) {
    final snackBar = SnackBar(
      duration: const Duration(seconds: 3),
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.green,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }