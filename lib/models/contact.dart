class Contact {
  final String name;
  final String surName;
  final String phoneNumber;
  final String? email;
  final int? otherNumber;

  Contact(
      {this.email = '@gmail.com',
      this.otherNumber = 123,
      required this.name,
      required this.surName,
      required this.phoneNumber});

  String get getName => name;
  String get getSurName => surName;
  String get getPhoneNumber => phoneNumber;
  String? get getEmail => email;
  int? get getOtherNumber => otherNumber;

  @override
  bool operator ==(covariant Contact other) => phoneNumber == other.phoneNumber;

  @override
  int get hashCode => phoneNumber.hashCode;
}
