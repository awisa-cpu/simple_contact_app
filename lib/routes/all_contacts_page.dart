import 'package:demo_provider_class/routes_constants/routes.dart';
import 'package:demo_provider_class/services/contact_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class AllContactsPage extends StatefulWidget {
  const AllContactsPage({super.key});

  @override
  State<AllContactsPage> createState() => _AllContactsPageState();
}

class _AllContactsPageState extends State<AllContactsPage> {
  bool searchShow = false;

  @override
  Widget build(BuildContext context) {
    // final contacts = context.watch<ContactProvider>().getContacts;

    //? method to seacrh for a contact
    // void seachContacts(String textValue) {
    //   setState(() {
    //     contacts.where((eachContact) => eachContact.getName
    //         .toLowerCase()
    //         .contains(textValue.toLowerCase()));
    //   });
    // }

    return Consumer<ContactProvider>(builder: (context, value, _) {
      return Scaffold(
        appBar: AppBar(
          title: searchShow
              ? const SizedBox.shrink()
              : const Text(
                  'Contacts',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
          actions: [
            searchShow
                ? const SizedBox(
                    width: 250,
                    child: TextField(
                      // onChanged: (value) => seachContacts(value),
                      decoration:  InputDecoration(hintText: 'Search ...'),
                    ),
                  )
                : const SizedBox.shrink(),
            InkWell(
              onTap: () {
                setState(() {
                  searchShow = !searchShow;
                });
              },
              child: const Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const Icon(
              Icons.more_vert,
              color: Colors.white,
            )
          ],
        ),
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
                    final contactList = value.getContacts;
                    final contact = contactList[index];

                    return Slidable(
                      endActionPane: ActionPane(
                        motion: const DrawerMotion(),
                        children: [
                          SlidableAction(
                            backgroundColor: Colors.red,
                            icon: Icons.delete,
                            onPressed: (context) {
                              context
                                  .read<ContactProvider>()
                                  .deleteFromContacts(contact);
                            },
                          ),
                          SlidableAction(
                            backgroundColor: Colors.green,
                            icon: Icons.message,
                            onPressed: (context) {
                              //delete contact
                            },
                          )
                        ],
                      ),
                      child: ListTile(
                        leading: const Icon(Icons.person),
                        title: Text(
                          contact.getName,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(contact.getPhoneNumber.toString()),
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
          onPressed: () => Navigator.of(context).pushNamed(newContact),
          child: const Icon(
            Icons.add,
            size: 30,
          ),
        ),
      );
    });
  }
}
