import 'dart:convert';

class Contact {
  final String? name;
  final String? surName;
  final String? phoneNumber;
  final String? email;
  final int? otherNumber;

  Contact({
    this.name,
    this.surName,
    this.phoneNumber,
    this.email,
    this.otherNumber,
  });

  Contact copyWith({
    String? name,
    String? surName,
    String? phoneNumber,
    String? email,
    int? otherNumber,
  }) {
    return Contact(
      name: name ?? this.name,
      surName: surName ?? this.surName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      otherNumber: otherNumber ?? this.otherNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'surName': surName,
      'phoneNumber': phoneNumber,
      'email': email,
      'otherNumber': otherNumber,
    };
  }

  factory Contact.fromMap(Map<String, dynamic> map) {
    return Contact(
      name: map['name'] != null ? map['name'] as String : null,
      surName: map['surName'] != null ? map['surName'] as String : null,
      phoneNumber:
          map['phoneNumber'] != null ? map['phoneNumber'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      otherNumber:
          map['otherNumber'] != null ? map['otherNumber'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Contact.fromJson(String source) =>
      Contact.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Contact(name: $name, surName: $surName, phoneNumber: $phoneNumber, email: $email, otherNumber: $otherNumber)';
  }

  @override
  bool operator ==(covariant Contact other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.surName == surName &&
        other.phoneNumber == phoneNumber &&
        other.email == email &&
        other.otherNumber == otherNumber;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        surName.hashCode ^
        phoneNumber.hashCode ^
        email.hashCode ^
        otherNumber.hashCode;
  }
}
