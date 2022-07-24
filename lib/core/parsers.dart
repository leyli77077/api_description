double? doubleParser(dynamic value) {
  if (value is String) {
    return double.parse(value);
  } else if (value is double) {
    return value;
  } else if (value is num) {
    return value.toDouble();
  } else {
    return null;
  }
}

int? intParser(dynamic value) {
  if (value is String) {
    return int.parse(value);
  } else if (value is int) {
    return value;
  } else if (value is num) {
    return value.toInt();
  } else {
    return null;
  }
}
