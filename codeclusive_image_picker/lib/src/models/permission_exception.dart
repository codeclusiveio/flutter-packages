// Copyright (c) 2023, Codeclusive. Use of this source code is governed by a
// MIT license that can be found in the LICENSE file.
abstract class PermissionException implements Exception {
  const PermissionException([this.message]);
  final String? message;

  @override
  String toString() {
    String result = 'PermissionException';
    if (message is String) return '$result: $message';
    return result;
  }

  @override
  bool operator ==(Object other) {
    return other is PermissionException && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}

class PermissionRequestException extends PermissionException {
  const PermissionRequestException([String? message]) : super(message);
}

class PermissionStateException extends PermissionException {
  const PermissionStateException([String? message]) : super(message);
}
