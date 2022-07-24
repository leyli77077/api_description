import 'dart:convert';

class LoginForm {
  final int phone;
  LoginForm({
    required this.phone,
  });

  LoginForm copyWith({
    int? phone,
  }) {
    return LoginForm(
      phone: phone ?? this.phone,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'phone': phone,
    };
  }

  factory LoginForm.fromMap(Map<String, dynamic> map) {
    return LoginForm(
      phone: map['phone'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginForm.fromJson(String source) =>
      LoginForm.fromMap(json.decode(source));

  @override
  String toString() => 'LoginForm(phone: $phone)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoginForm && other.phone == phone;
  }

  @override
  int get hashCode => phone.hashCode;
}
