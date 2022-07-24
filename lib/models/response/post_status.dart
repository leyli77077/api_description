import 'dart:convert';

import 'package:flutter/foundation.dart';

class PostStatus {
  final bool status;
  final Map<String, List<String>>? errors;
  PostStatus({
    required this.status,
    this.errors,
  });

  PostStatus copyWith({
    bool? status,
    Map<String, List<String>>? errors,
  }) {
    return PostStatus(
      status: status ?? this.status,
      errors: errors ?? this.errors,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'errors': errors,
    };
  }

  factory PostStatus.fromMap(Map<String, dynamic> map) {
    return PostStatus(
      status: map['status'] ?? false,
      errors: Map<String, List<String>>.from(map['errors']),
    );
  }

  String toJson() => json.encode(toMap());

  factory PostStatus.fromJson(String source) =>
      PostStatus.fromMap(json.decode(source));

  @override
  String toString() => 'PostStatus(status: $status, errors: $errors)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PostStatus &&
        other.status == status &&
        mapEquals(other.errors, errors);
  }

  @override
  int get hashCode => status.hashCode ^ errors.hashCode;
}
