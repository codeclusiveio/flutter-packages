abstract class ImagePickerException implements Exception {
  const ImagePickerException([this.message]);
  final String? message;

  @override
  String toString() {
    String result = 'ImagePickerException';
    if (message is String) return '$result: $message';
    return result;
  }
}

class GalleryScanException extends ImagePickerException {
  const GalleryScanException([String? message]) : super(message);
}
