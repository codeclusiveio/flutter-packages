import 'package:codeclusive_image_picker/services/codeclusive_image_picker_service.dart';
import 'package:codeclusive_image_picker/services/codeclusive_permissions_service.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_manager/photo_manager.dart';

class CodeclusiveImagePicker {
  final CodeclusiveImagePickerService _imagePickerService;
  final CodeclusivePermissionsService _permissionsService;

  CodeclusiveImagePicker(this._imagePickerService, this._permissionsService);

  Future<PermissionStatus?> requestPermissions() async {
    final hasAccess = await _permissionsService.requestPermissions();
    return hasAccess;
  }

  Future<PermissionStatus?> getPermissionStatus() async {
    return await _permissionsService.getPermissionState();
  }

  Widget goToAppSettings() {
    final alert = AlertDialog(
      title: const Text('Missing Permissions - go to settings'),
      actions: [
        TextButton(onPressed: () {}, child: const Text('Cancel')),
        TextButton(
            onPressed: () {
              _permissionsService.goToAppSettings();
            },
            child: const Text('Go to settings')),
      ],
    );
    return alert;
  }

  Future<List<AssetPathEntity>?> getAlbums() async {
    final hasAccess = await requestPermissions();
    if (hasAccess != null && hasAccess.isGranted) {
      return await _imagePickerService.fetchAlbums();
    }

    return [];
  }

  Future<List<AssetEntity>?> getImagesFromAlbum(AssetPathEntity album, int page) async {
    final hasAccess = await requestPermissions();

    if (hasAccess != null && hasAccess.isGranted) {
      final images = await _imagePickerService.fetchImagesFromAlbum(album, page);
      return images;
    }

    return [];
  }

  Future<List<AssetEntity>?> getAllImages() async {
    final hasAccess = await requestPermissions();

    if (hasAccess != null && hasAccess.isGranted) {
      final images = await _imagePickerService.fetchAllImages();
      return images;
    }

    return [];
  }
}
