import 'dart:collection';

import 'package:demo_provider_class/models/contact.dart';
import 'package:flutter/material.dart';

class ContactProvider extends ChangeNotifier {
  final List<Contact> _allContacts = [];

  UnmodifiableListView<Contact> get getContacts =>
      UnmodifiableListView(_allContacts);

  //? function to add to contacts list
  void addToContact(Contact newContact) {
    if (_allContacts.contains(newContact)) {
      return;
    }
    _allContacts.add(newContact);
    notifyListeners();
  }

  //?delete from contacts list
  void deleteFromContacts(Contact deleteContact) {
    if(_allContacts.isEmpty){
      return;
    }
    _allContacts.remove(deleteContact);
    notifyListeners();
  }

  //? delete all contacts
  void deleteAllContacts() {
    _allContacts.clear();
    notifyListeners();
  }
}
