import 'dart:convert';

class RegisterForm {
  final String firstName;
  final String lastName;
  final int phone;
  final String email;
  final String address;
  RegisterForm({
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.address,
  });

  RegisterForm copyWith({
    String? firstName,
    String? lastName,
    int? phone,
    String? email,
    String? address,
  }) {
    return RegisterForm(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'firstname': firstName,
      'lastname': lastName,
      'phone': phone,
      'email': email,
      'address': address,
    };
  }

  factory RegisterForm.fromMap(Map<String, dynamic> map) {
    return RegisterForm(
      firstName: map['first_name'] ?? '',
      lastName: map['last_name'] ?? '',
      phone: map['phone']?.toInt() ?? 0,
      email: map['email'] ?? '',
      address: map['address'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterForm.fromJson(String source) =>
      RegisterForm.fromMap(json.decode(source));

  @override
  String toString() =>
      'RegisterForm(firstName: $firstName, lasstName: $lastName, phone: $phone, email: $email, address: $address)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RegisterForm &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.phone == phone &&
        other.email == email &&
        other.address == address;
  }

  @override
  int get hashCode =>
      firstName.hashCode ^
      lastName.hashCode ^
      phone.hashCode ^
      email.hashCode ^
      address.hashCode;
}
