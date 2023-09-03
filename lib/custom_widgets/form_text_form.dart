
import 'package:flutter/material.dart';


typedef Validate = String? Function(String? value);

class FormTextForm extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Validate validate;

  const FormTextForm({
    super.key,
    required this.controller,
    required this.hintText,
    required this.validate,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
        validator: validate);
  }
}