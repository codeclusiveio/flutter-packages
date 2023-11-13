abstract class ImagePickerException implements Exception {
  const ImagePickerException([this.message]);
  final String? message;

  @override
  String toString() {
    String result = 'ImagePickerException';
    if (message is String) return '$result: $message';
    return result;
  }

  @override
  bool operator ==(Object other) {
    return other is ImagePickerException && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}

class GalleryScanException extends ImagePickerException {
  const GalleryScanException([String? message]) : super(message);
}
