// Copyright (c) 2023, Codeclusive. Use of this source code is governed by a
// MIT license that can be found in the LICENSE file.
abstract class CameraPickerException implements Exception {
  const CameraPickerException([this.message]);
  final String? message;

  @override
  String toString() {
    String result = 'ImagePickerException';
    if (message is String) return '$result: $message';
    return result;
  }

  @override
  bool operator ==(Object other) {
    return other is CameraPickerException && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}

class TakePictureException extends CameraPickerException {
  const TakePictureException([String? message]) : super(message);
}
