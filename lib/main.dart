import 'package:demo_provider_class/view/all_contacts_page.dart';
import 'package:demo_provider_class/view/new_contact.dart';
import 'package:demo_provider_class/routes_constants/routes.dart';
import 'package:demo_provider_class/services/contact_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ContactProvider(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.grey,
          ),
          routes: {
            homePage: (context) => const AllContactsPage(),
            newContact: (context) => const NewContactPage(),
          },
          home: const AllContactsPage()),
    );
  }
}
