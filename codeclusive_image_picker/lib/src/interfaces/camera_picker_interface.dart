import 'package:image_picker/image_picker.dart';

abstract class CameraPickerInterface {
  Future<XFile?> takePhoto({
    int? imageQuality,
    double? maxWidth,
    double? maxHeight,
  });
}
