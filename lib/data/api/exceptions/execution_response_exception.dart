class ExecutionRequestException implements Exception {
  final String message;

  ExecutionRequestException(this.message);

  @override
  String toString() => 'ExecutionResponseException{message: $message}';
}
