import 'package:demo_provider_class/view/detailed_contact_page.dart';
import 'package:demo_provider_class/routes_constants/routes.dart';
import 'package:demo_provider_class/services/contact_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllContactsPage extends StatelessWidget {
  const AllContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ContactProvider>(
      builder: (context, value, _) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(title: const Text('Contacts')),
            body: value.getContacts.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'lib/assets/box.png',
                          width: 150,
                          height: 150,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'You have no contacts yet',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ListView.builder(
                      itemCount: value.getContacts.length,
                      itemBuilder: (context, index) {
                        final contact = value.getContacts[index];

                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailedContact(
                                  contact: contact,
                                ),
                              ),
                            );
                          },
                          child: ListTile(
                            leading: const Icon(Icons.person),
                            title: Text(
                              contact.name ?? '',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(contact.phoneNumber ?? ''),
                            trailing: Icon(
                              Icons.call,
                              color: Colors.green.shade600,
                            ),
                            isThreeLine: true,
                          ),
                        );
                      },
                    ),
                  ),
            floatingActionButton: FloatingActionButton(
              enableFeedback: false,
              onPressed: () {
                Navigator.of(context).pushNamed(newContact);
              },
              child: const Icon(
                Icons.add,
                size: 30,
              ),
            ),
          ),
        );
      },
    );
  }
}
