import 'package:demo_provider_class/routes/all_contacts_page.dart';
import 'package:demo_provider_class/routes/detailed_contact_page.dart';
import 'package:demo_provider_class/routes/new_contact.dart';
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
      create: (_) => ContactProvider() ,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          routes: {
            homePage :(context) => const AllContactsPage(),
            newContact :(context) =>  const NewContactPage(),
            detailedPage :(context) => const DetailedContact(),
          },
          home: const AllContactsPage()),
    );
  }
}
