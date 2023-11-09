abstract class PermissionException implements Exception {
  const PermissionException([this.message]);
  final String? message;

  @override
  String toString() {
    String result = 'PermissionException';
    if (message is String) return '$result: $message';
    return result;
  }
}

class PermissionRequestException extends PermissionException {
  const PermissionRequestException([String? message]) : super(message);
}

class PermissionStateException extends PermissionException {
  const PermissionStateException([String? message]) : super(message);
}
