import 'package:codeclusive_image_picker/interfaces/codeclusive_image_picker_interface.dart';
import 'package:logger/logger.dart';
import 'package:photo_manager/photo_manager.dart';

/// Repository used for reading content of device gallery such as albums and photos
class CodeclusiveImagePickerRepository implements CodeclusiveImagePickerInterface {
  CodeclusiveImagePickerRepository();
  final Logger _logger = Logger();

  /// This method returns [List]<[AssetPathEntity]> of albums stored in device gallery
  /// Requires:
  ///
  /// - Storage permissions for Android SDK < 33,
  /// - Photos permissions for IOS and Android SDK >= 33
  @override
  Future<List<AssetPathEntity>> fetchAlbumList() async {
    List<AssetPathEntity> albums = [];
    try {
      albums = await PhotoManager.getAssetPathList(
        type: RequestType.image,
        filterOption: FilterOptionGroup(
          imageOption: const FilterOption(needTitle: true),
        ),
        hasAll: true,
        onlyAll: false,
      );
    } catch (e, s) {
      _logger.e('[CodeclusiveImagePicker]: Error while fetching album list: $e', error: e, stackTrace: s);
      return [];
    }
    return albums;
  }

  /// This method returns [int] - number of all photos stored on the device
  @override
  Future<int> getImagesCount() async {
    int count = 0;
    try {
      count = await PhotoManager.getAssetCount();
    } catch (e) {
      return 0;
    }
    return count;
  }
}
