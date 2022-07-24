import 'dart:convert';

import 'package:flutter_shop/core/parsers.dart';

class User {
  final int id;
  final String email;
  final int phone;
  final String firstName;
  final String lastName;
  final String status;
  User({
    required this.id,
    required this.email,
    required this.phone,
    required this.firstName,
    required this.lastName,
    required this.status,
  });

  User copyWith({
    int? id,
    String? email,
    int? phone,
    String? firstName,
    String? lastName,
    String? status,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'phone': phone,
      'first_name': firstName,
      'last_name': lastName,
      'status': status,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id']?.toInt() ?? 0,
      email: map['email'] ?? '',
      phone: intParser(map['phone']) ?? 0,
      firstName: map['first_name'] ?? '',
      lastName: map['last_name'] ?? '',
      status: map['status'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(id: $id, email: $email, phone: $phone, firstName: $firstName, lastName: $lastName, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.id == id &&
        other.email == email &&
        other.phone == phone &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.status == status;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        email.hashCode ^
        phone.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        status.hashCode;
  }
}
