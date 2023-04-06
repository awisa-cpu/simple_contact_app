import 'package:demo_provider_class/services/contact_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailedContact extends StatefulWidget {
  const DetailedContact({super.key});

  @override
  State<DetailedContact> createState() => _DetailedContactState();
}

class _DetailedContactState extends State<DetailedContact> {
  bool searchShow = false;
  @override
  Widget build(BuildContext context) {
    final contacts = context.watch<ContactProvider>().getContacts;
    return Scaffold(
      appBar: AppBar(
        title: searchShow
            ? const SizedBox.shrink()
            : const Text(
                'Contacts',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
        actions: [
          searchShow
              ? const SizedBox(
                  width: 250,
                  child: TextField(
                    // onChanged: (value) => seachContacts(value),
                    decoration: InputDecoration(hintText: 'Search ...'),
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
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: const [
                SizedBox(
                  width: 120,
                ),
                CircleAvatar(
                  radius: 55,
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 95,
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                Icon(Icons.delete),
                SizedBox(
                  width: 10,
                ),
                Icon(Icons.edit)
              ],
            ),
            const SizedBox(
              height: 35,
            ),
            const Center(
              child: Text(
                'username',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            Row(
              children: [
                const Text('Phone Number'),
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
                    )),
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
}
