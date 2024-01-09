// Copyright (c) 2023, Codeclusive. Use of this source code is governed by a
// MIT license that can be found in the LICENSE file.
import 'package:codeclusive_image_picker/src/interfaces/image_picker_interface.dart';
import 'package:codeclusive_image_picker/src/models/image_picker_exception.dart';
import 'package:photo_manager/photo_manager.dart';

/// Repository used for reading content of device gallery such as albums and photos
class ImagePickerRepository implements ImagePickerInterface {
  ImagePickerRepository();

  /// This method returns [List]<[AssetPathEntity]> of albums stored in device gallery
  /// Requires:
  ///
  /// - Storage permissions for Android SDK < 33,
  /// - Photos permissions for IOS and Android SDK >= 33
  ///
  /// When error occurs this method throws [GalleryScanException]
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
      throw GalleryScanException(
          'Error while fetching album list. Error $e, StackTrace :$s');
    }
    return albums;
  }

  /// This method returns [int] - number of all photos stored on the device
  ///
  /// When error occurs this method throws [GalleryScanException]
  @override
  Future<int> getImagesCount() async {
    int count = 0;
    try {
      count = await PhotoManager.getAssetCount();
    } catch (e, s) {
      throw GalleryScanException(
          'Error while getting assets count. Error: $e, stackTrace: $s');
    }
    return count;
  }
}
