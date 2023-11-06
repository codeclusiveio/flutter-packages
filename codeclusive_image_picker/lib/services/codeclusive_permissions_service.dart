// ignore_for_file: avoid_print

import 'dart:io';

import 'package:codeclusive_image_picker/repositories/codeclusive_permission_repository.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_manager/photo_manager.dart';

class CodeclusivePermissionsService {
  final CodeclusivePermissionRepository _codeclusivePermissionRepository;

  CodeclusivePermissionsService(this._codeclusivePermissionRepository);

  Future<PermissionStatus?> requestPermissions() async {
    try {
      PermissionState? permissionIOS;
      if (Platform.isAndroid) {
        permissionIOS = null;

        final androidInfo = await DeviceInfoPlugin().androidInfo;
        final sdkVersion = androidInfo.version.sdkInt;

        if (sdkVersion >= 33) {
          await _codeclusivePermissionRepository.getPhotosPermissionsAndroid();
          final androidStatus = await _codeclusivePermissionRepository.getHandlerStatus(Permission.photos);
          return androidStatus;
        } else {
          await _codeclusivePermissionRepository.getStoragePermissionsAndroid();
          final androidStatus = await _codeclusivePermissionRepository.getHandlerStatus(Permission.storage);
          return androidStatus;
        }
      } else if (Platform.isIOS) {
        permissionIOS = await _codeclusivePermissionRepository.getPermissionsIOS();
        print('WIKTOR_LOG: Permission status: $permissionIOS');
        return await _codeclusivePermissionRepository.getHandlerStatus(Permission.photos);
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  Future<PermissionStatus?> getPermissionState() async {
    final androidInfo = await DeviceInfoPlugin().androidInfo;
    final sdkVersion = androidInfo.version.sdkInt;

    if (Platform.isAndroid) {
      if (sdkVersion >= 33) {
        return await _codeclusivePermissionRepository.getHandlerStatus(Permission.photos);
      } else {
        return await _codeclusivePermissionRepository.getHandlerStatus(Permission.storage);
      }
    } else if (Platform.isIOS) {
      return await _codeclusivePermissionRepository.getHandlerStatus(Permission.photos);
    }
    return null;
  }

  void goToAppSettings() {
    _codeclusivePermissionRepository.goToSettings();
  }
}
