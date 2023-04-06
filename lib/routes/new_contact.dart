import 'package:demo_provider_class/models/contact.dart';
import 'package:demo_provider_class/routes_constants/routes.dart';
import 'package:demo_provider_class/services/contact_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewContactPage extends StatefulWidget {
  const NewContactPage({super.key});

  @override
  State<NewContactPage> createState() => _NewContactPageState();
}

class _NewContactPageState extends State<NewContactPage> {
  late TextEditingController _name;
  late TextEditingController _surName;
  late TextEditingController _phoneNumber;

  @override
  void initState() {
    _name = TextEditingController();
    _surName = TextEditingController();
    _phoneNumber = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _name.dispose();
    _surName.dispose();
    _phoneNumber.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
     
        title: const Text('Add',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Name',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              TextField(
                controller: _name,
                decoration: const InputDecoration(
                  hintText: "Enter name",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Surname',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              TextField(
                controller: _surName,
                decoration: const InputDecoration(
                  hintText: "Enter Surname",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Phone Number',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              TextField(
                controller: _phoneNumber,
                decoration: const InputDecoration(
                  hintText: "+234...",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(
                height: 45,
              ),
              Center(
                child: ElevatedButton(
                    onPressed: () {
                      final String name = _name.text;
                      final String surName = _surName.text;
                      final String number = _phoneNumber.text;

                      final provider = context.read<ContactProvider>();
                      if (name.isNotEmpty &&
                          surName.isNotEmpty &&
                          number.isNotEmpty) {
                        Contact newContact = Contact(
                            name: name, surName: surName, phoneNumber: number);

                        provider.addToContact(newContact);
                        Navigator.of(context).pop();
                      }
                    },
                    child: const Text(
                      'Add',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
