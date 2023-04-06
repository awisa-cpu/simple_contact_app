import 'package:demo_provider_class/models/contact.dart';
import 'package:flutter/material.dart';
import 'dart:developer' show log;

class ContactProvider extends ChangeNotifier {
  final List<Contact> _allContacts = [];

  List<Contact> get getContacts => _allContacts;

  //? function to add to contacts list
  void addToContact(Contact newContact) {
    if (_allContacts.contains(newContact)) {
      return;
    }
    _allContacts.add(newContact);
    notifyListeners();
    log('addToContact has been called');
  }

  //?delete from contacts list
  void deleteFromContacts(Contact deleteContact) {
    _allContacts.remove(deleteContact);
    notifyListeners();
    log('deleteFromContacts has been called');
  }

  //? delete all contacts
  void deleteAllContacts() {
    _allContacts.clear();
    notifyListeners();
    log('deleteAllContacts  has been called');
  }
}
