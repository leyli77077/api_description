import 'dart:convert';

import 'package:flutter_shop/models/user.dart';

class LoginResponse {
  final String accessToken;
  final User user;
  LoginResponse({
    required this.accessToken,
    required this.user,
  });

  LoginResponse copyWith({
    String? accessToken,
    User? user,
  }) {
    return LoginResponse(
      accessToken: accessToken ?? this.accessToken,
      user: user ?? this.user,
    );
  }

// {
//  "success":true,
// "data":{
//  "access_token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vc2hvcC5hc21hbnRpei5jb20vYXBpL2N1c3RvbWVycy9hdXRoL2xvZ2luIiwiaWF0IjoxNjU4OTE2MDczLCJleHAiOjE2NjQxMDAwNzMsIm5iZiI6MTY1ODkxNjA3MywianRpIjoiMWVUS2dzRTgzVVFUMlg0eCIsInN1YiI6IjEwIn0.BKVzHyfpHsFu0qLqaJcC3OlbUkKLZydS8Pbd5hWVzOo",
//  "user":
//    {
//      "id":10,
//      "phone":"99365713638",
//      "email":"gdhsh@tets.co",
//      "firstname":"trhsjs",
//      "lastname":"dhshshsgshs",
//      "address_id":null,
//      "meta":null,
//      "is_blocked":false,
//      "verification_code":null,
//      "verification_token":null,
//      "deleted_at":null,
//      "created_at":"2022-07-27T10:00:59.000000Z",
//      "updated_at":"2022-07-27T10:01:13.000000Z"
//     }
//    }
//  }
  Map<String, dynamic> toMap() {
    return {
      'access_token': accessToken,
      'customer': user.toMap(),
    };
  }

  factory LoginResponse.fromMap(Map<String, dynamic> map) {
    return LoginResponse(
      accessToken: map['access_token'] ?? '',
      user: User.fromMap(map['user']),
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginResponse.fromJson(String source) =>
      LoginResponse.fromMap(json.decode(source));

  @override
  String toString() => 'LoginResponse(accessToken: $accessToken, user: $user)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoginResponse &&
        other.accessToken == accessToken &&
        other.user == user;
  }

  @override
  int get hashCode => accessToken.hashCode ^ user.hashCode;
}
