import 'package:demo_provider_class/config.dart';
import 'package:demo_provider_class/models/contact.dart';
import 'package:demo_provider_class/services/contact_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../custom_widgets/form_text.dart';
import '../custom_widgets/form_text_form.dart';

class NewContactPage extends StatefulWidget {
  const NewContactPage({super.key});

  @override
  State<NewContactPage> createState() => _NewContactPageState();
}

class _NewContactPageState extends State<NewContactPage> {
  late TextEditingController nameController;
  late TextEditingController surNameController;
  late TextEditingController phoneNumberController;

  final _formKey = GlobalKey<FormState>();
  // final regEx =
  //     RegExp('rd{3}-d{4}-{4}', caseSensitive: false, multiLine: false);

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    surNameController = TextEditingController();
    phoneNumberController = TextEditingController();
  }

  @override
  void dispose() {
    nameController.dispose();
    surNameController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //
      appBar: AppBar(
        title: const Text(
          'Add',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),

      //
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //
                const FormText(text: "Name"),
                const SizedBox(
                  height: 7,
                ),
                FormTextForm(
                  controller: nameController,
                  hintText: "Enter name",
                  validate: (value) {
                    if (value == null || value.isEmpty) {
                      return "Name is required";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),

                //
                const FormText(text: "Surname"),
                const SizedBox(
                  height: 7,
                ),
                FormTextForm(
                  controller: surNameController,
                  hintText: "Enter surname",
                  validate: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Surname is required';
                    }

                    return null;
                  },
                ),

                const SizedBox(
                  height: 15,
                ),

                //
                const FormText(text: 'Phone number'),
                const SizedBox(
                  height: 7,
                ),
                FormTextForm(
                  controller: phoneNumberController,
                  hintText: '+234...',
                  validate: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Phone is required';
                    }
                    // if (!regEx.hasMatch(value)) {
                    //   return "Incorrect format";
                    // }

                    return null;
                  },
                ),
                const SizedBox(
                  height: 45,
                ),

                //add button
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        addToContact(context);
                        Navigator.of(context).pop();
                        Config.showMessage(
                          context: context,
                          message: 'Added successfully',
                        );
                      }
                    },
                    child: const Text(
                      'Add',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void addToContact(BuildContext context) {
    final String name = nameController.text;
    final String surName = surNameController.text;
    final String number = phoneNumberController.text;

    final provider = context.read<ContactProvider>();

    Contact newContact =
        Contact(name: name, surName: surName, phoneNumber: number);

    provider.addToContact(newContact);
  }
}
