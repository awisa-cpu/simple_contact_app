import 'package:flutter/material.dart';

class Config {
  static showMessage({
    required BuildContext context,
    String message = 'About creating a contact ...',
  }) {
    SnackBar snackbar = SnackBar(
      duration: const Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.grey,
      elevation: 10,
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}
