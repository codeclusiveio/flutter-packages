// Copyright (c) 2023, Codeclusive. Use of this source code is governed by a
// MIT license that can be found in the LICENSE file.

import 'package:codeclusive_image_picker/src/services/image_picker_service.dart';
import 'package:codeclusive_image_picker/src/services/permissions_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_manager/photo_manager.dart';

/// CCImagePicker is used for picking images from device gallery.
/// To use [CCImagePicker] add proper permissions to the following files:
/// <br/> ./ios/Runner/Info.plist:
/// - [NSPhotoLibraryAddUsageDescription]
/// - [NSPhotoLibraryUsageDescription]
///
/// <br/> ./android/app/src/main/AndroidManifest.xml:
/// - [WRITE_EXTERNAL_STORAGE]
/// - [READ_EXTERNAL_STORAGE]
/// - [READ_MEDIA_IMAGES]
/// - [READ_MEDIA_AUDIO]
/// - [READ_MEDIA_VIDEO]
class CCImagePicker {
  late final ImagePickerService _imagePickerService;
  late final PermissionsService _permissionsService;

  CCImagePicker() {
    _imagePickerService = ImagePickerService();
    _permissionsService = PermissionsService();
  }

  /// This method requests gallery permissions popup and returns [PermissionStatus]?
  ///
  /// When error occurs this method throws [PermissionStateException]
  Future<PermissionStatus> requestPermissions() async {
    try {
      return await _permissionsService.requestPermissions();
    } catch (e) {
      rethrow;
    }
  }

  /// This method returns current [PermissionStatus]?
  ///
  /// When error occurs this method throws [PermissionRequestException]
  Future<PermissionStatus> getPermissionStatus() async {
    try {
      return await _permissionsService.getPermissionState();
    } catch (e) {
      rethrow;
    }
  }

  /// This method navigates user to system app settings
  Future<void> goToAppSettings() async {
    try {
      _permissionsService.goToAppSettings();
    } catch (e) {
      rethrow;
    }
  }

  /// This method returns [List]<[AssetPathEntity]> containing gallery albums from the device
  ///
  /// When error occurs this method throws [GalleryScanException]
  Future<List<AssetPathEntity>> getAlbums() async {
    try {
      final hasAccess = await requestPermissions();
      if (hasAccess.isGranted) {
        return await _imagePickerService.fetchAlbums();
      }

      return [];
    } catch (e) {
      rethrow;
    }
  }

  /// This method returns  __[List]<[AssetEntity]>__ containing all images from specified albums from the device.
  /// Takes one parameter
  ///
  /// - [AssetPathEntity] album - select album from which photos will be fetched
  ///
  /// When error occurs this method throws [GalleryScanException]
  Future<List<AssetEntity>> getImagesFromAlbum(AssetPathEntity album) async {
    try {
      final hasAccess = await requestPermissions();

      if (hasAccess.isGranted) {
        final images = await _imagePickerService.fetchImagesFromAlbum(album);
        return images;
      }

      return [];
    } catch (e) {
      rethrow;
    }
  }

  /// This method returns paginated __[List]<[AssetEntity]>__ containing images from specified albums from the device.
  /// Takes three parameters
  ///
  /// - [AssetPathEntity] album - select album from which photos will be fetched
  /// -  [int] page - specify result page
  /// -  [int]? maxBatchSize - specify maximum size of returned images list
  ///
  /// When error occurs this method throws [GalleryScanException]
  Future<List<AssetEntity>> getImagesFromAlbumPaginated(
    AssetPathEntity album,
    int page, {
    int? maxBatchSize = 30,
  }) async {
    try {
      final hasAccess = await requestPermissions();

      if (hasAccess.isGranted) {
        final images = await _imagePickerService
            .fetchPaginatedImages(album, page, maxBatchSize: maxBatchSize);
        return images;
      }

      return [];
    } catch (e) {
      rethrow;
    }
  }

  /// This function returns __[List]<[AssetEntity]>__ of images stored on the device
  ///
  /// When error occurs this method throws [GalleryScanException]
  Future<List<AssetEntity>> getAllImages() async {
    try {
      final hasAccess = await requestPermissions();

      if (hasAccess.isGranted) {
        final images = await _imagePickerService.fetchAllImages();
        return images;
      }

      return [];
    } catch (e) {
      rethrow;
    }
  }
}
