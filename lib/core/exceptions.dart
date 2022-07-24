class VerificationException implements Exception {
  final Map<String, List<String>>? messages;
  VerificationException(this.messages);
}

class SingleErrorException implements Exception {
  final String? error;
  final Map<String, String>? header;
  SingleErrorException({this.error, this.header});
}
