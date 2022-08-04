import 'dart:convert';

class OtpForm {
  final int phone;
  final int? otp;
  final bool? rememberMe;
  OtpForm({
    required this.phone,
    this.otp,
    this.rememberMe,
  });

  OtpForm copyWith({
    int? phone,
    int? otp,
    bool? rememberMe,
  }) {
    return OtpForm(
      phone: phone ?? this.phone,
      otp: otp ?? this.otp,
      rememberMe: rememberMe ?? this.rememberMe,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'phone': phone,
      'otp': otp,
      'rememberMe': rememberMe,
    };
  }

  factory OtpForm.fromMap(Map<String, dynamic> map) {
    return OtpForm(
      phone: map['phone']?.toInt() ?? 0,
      otp: map['otp']?.toInt(),
      rememberMe: map['rememberMe'],
    );
  }

  String toJson() => json.encode(toMap());

  factory OtpForm.fromJson(String source) =>
      OtpForm.fromMap(json.decode(source));

  @override
  String toString() =>
      'OtpWidget(phone: $phone, otp: $otp, rememberMe: $rememberMe)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OtpForm &&
        other.phone == phone &&
        other.otp == otp &&
        other.rememberMe == rememberMe;
  }

  @override
  int get hashCode => phone.hashCode ^ otp.hashCode ^ rememberMe.hashCode;
}
