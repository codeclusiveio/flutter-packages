import 'package:codeclusive_image_picker/src/repositories/camera_picker_repository.dart';
import 'package:image_picker/image_picker.dart';

/// Service responsible for opening up camera view and returning taken picture.
class CameraPickerService {
  late final CameraPickerRepository _cameraPickerRepository;

  CameraPickerService() {
    _cameraPickerRepository = CameraPickerRepository();
  }

  Future<XFile?> takePhoto({
    int? imageQuality,
    double? maxWidth,
    double? maxHeight,
  }) async =>
      _cameraPickerRepository.takePhoto(
        imageQuality: imageQuality,
        maxWidth: maxWidth,
        maxHeight: maxHeight,
      );
}
