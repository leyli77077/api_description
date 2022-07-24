import 'dart:convert';

class RegisterForm {
  final String firstName;
  final String lastName;
  final int phone;
  RegisterForm({
    required this.firstName,
    required this.lastName,
    required this.phone,
  });

  RegisterForm copyWith({
    String? firstName,
    String? lastName,
    int? phone,
  }) {
    return RegisterForm(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phone: phone ?? this.phone,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'phone': phone,
    };
  }

  factory RegisterForm.fromMap(Map<String, dynamic> map) {
    return RegisterForm(
      firstName: map['first_name'] ?? '',
      lastName: map['last_name'] ?? '',
      phone: map['phone']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterForm.fromJson(String source) =>
      RegisterForm.fromMap(json.decode(source));

  @override
  String toString() =>
      'RegisterForm(firstName: $firstName, lasstName: $lastName, phone: $phone)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RegisterForm &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.phone == phone;
  }

  @override
  int get hashCode => firstName.hashCode ^ lastName.hashCode ^ phone.hashCode;
}
