import 'package:demo_provider_class/config.dart';
import 'package:demo_provider_class/routes_constants/routes.dart';
import 'package:demo_provider_class/services/contact_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/contact.dart';

class DetailedContact extends StatelessWidget {
  final Contact contact;
  const DetailedContact({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(contact.name ?? ''),
      ),

      //body
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),

            //
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(
                  width: 120,
                ),
                const CircleAvatar(
                  radius: 55,
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 95,
                  ),
                ),
                const SizedBox(
                  width: 40,
                ),
                InkWell(
                    onTap: () {
                      showDialogConfirmation(context);
                    },
                    child: const Icon(Icons.delete)),
                const SizedBox(
                  width: 12,
                ),
                const Icon(Icons.edit)
              ],
            ),
            const SizedBox(
              height: 35,
            ),
            Center(
              child: Text(
                contact.name ?? '',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 35,
            ),

            //
            Row(
              children: [
                Text(contact.phoneNumber ?? ''),
                const Spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      backgroundColor: Colors.green.shade400),
                  onPressed: () {},
                  child: const Icon(
                    Icons.call,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    onPressed: () {},
                    child: const Icon(
                      Icons.message,
                      color: Colors.white,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<dynamic> showDialogConfirmation(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Delete Contact',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              fontFamily: 'Roboto',
            ),
          ),
          content: Text(
            'Are you sure you want to remove ${contact.name} from your contacts?',
            style: const TextStyle(fontSize: 14, fontFamily: 'Roboto'),
          ),
          actions: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: const Text(
                      'No',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  InkWell(
                    onTap: () {
                      deleteContact(context);
                    },
                    child: const Text(
                      'Yes',
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            )
          ],
        );
      },
    );
  }

  void deleteContact(BuildContext context) {
    context.read<ContactProvider>().deleteFromContacts(contact);
    Navigator.of(context).pushNamedAndRemoveUntil(homePage, (route) => false);
    Config.showMessage(context: context, message: 'Deleted Successfully');
  }
}
