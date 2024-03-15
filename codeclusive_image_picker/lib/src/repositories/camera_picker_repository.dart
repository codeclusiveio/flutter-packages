import 'package:codeclusive_image_picker/cc_image_picker.dart';
import 'package:codeclusive_image_picker/src/interfaces/camera_picker_interface.dart';
import 'package:image_picker/image_picker.dart';

class CameraPickerRepository implements CameraPickerInterface {
  /// Opens native camera popup. If taking photo was successful, returns [Xfile] which contains all gathered data within it's exif. Exif metadata has to be read by an external library.
  @override
  Future<XFile?> takePhoto({
    int? imageQuality,
    double? maxWidth,
    double? maxHeight,
  }) async {
    try {
      final ImagePicker picker = ImagePicker();

      final XFile? photo = await picker.pickImage(
          source: ImageSource.camera,
          imageQuality: imageQuality,
          maxWidth: maxWidth,
          maxHeight: maxHeight);

      return photo;
    } catch (e, s) {
      throw TakePictureException(
          'Error while taking a photo from camera: $e, stack: $s');
    }
  }
}
