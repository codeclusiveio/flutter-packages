import 'dart:io';

import 'package:codeclusive_image_picker/repositories/codeclusive_permission_repository.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:logger/logger.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_manager/photo_manager.dart';

/// This service is used to ask for required permissions for codeclusive_image_picker.
class CodeclusivePermissionsService {
  late final CodeclusivePermissionRepository _codeclusivePermissionRepository;
  late final Logger _logger;

  CodeclusivePermissionsService() {
    _codeclusivePermissionRepository = CodeclusivePermissionRepository();
    _logger = Logger();
  }

  /// Method used for asking for permissions required for codeclusive_image_picker which returns [PermissionStatus]?.
  /// From Android SDK 33 to be able to fetch information about gallery content
  /// it requires asking for [Permission.photos] permissions. Before Android SDK 33 it requires [Permission.storage] permissions.
  /// Android  permissions  returns [PermissionStatus].
  /// IOS permissions returns [PermissionState].
  Future<PermissionStatus?> requestPermissions() async {
    try {
      if (Platform.isAndroid) {
        final androidInfo = await DeviceInfoPlugin().androidInfo;
        final sdkVersion = androidInfo.version.sdkInt;

        if (sdkVersion >= 33) {
          await _codeclusivePermissionRepository.getPhotosPermissionsAndroid;
          final androidStatus = await _codeclusivePermissionRepository.getHandlerStatus(Permission.photos);
          return androidStatus;
        } else {
          await _codeclusivePermissionRepository.getStoragePermissionsAndroid;
          final androidStatus = await _codeclusivePermissionRepository.getHandlerStatus(Permission.storage);
          return androidStatus;
        }
      }

      await _codeclusivePermissionRepository.getPermissionsIOS;
      return await _codeclusivePermissionRepository.getHandlerStatus(Permission.photos);
    } catch (e, s) {
      _logger.e('[CodeclusivePermissionService]: Error while requesting permissions', error: e, stackTrace: s);
      return null;
    }
  }

  /// Method used for fetching information about current [PermissionStatus]
  /// Returns [Permission.photos] for IOS and Android SDK above version 33
  /// or [Permission.storage] for Android SDK  lower than version 33
  Future<PermissionStatus?> getPermissionState() async {
    try {
      if (Platform.isAndroid) {
        final androidInfo = await DeviceInfoPlugin().androidInfo;
        final sdkVersion = androidInfo.version.sdkInt;
        if (sdkVersion >= 33) {
          return await _codeclusivePermissionRepository.getHandlerStatus(Permission.photos);
        } else {
          return await _codeclusivePermissionRepository.getHandlerStatus(Permission.storage);
        }
      }
      return await _codeclusivePermissionRepository.getHandlerStatus(Permission.photos);
    } catch (e, s) {
      _logger.e('[CodeclusivePermissionService]: Error while checking permissions', error: e, stackTrace: s);
      return null;
    }
  }

  /// Method used to navigate to apps system settings screen
  void goToAppSettings() => _codeclusivePermissionRepository.goToSettings();
}
