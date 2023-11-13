import 'package:codeclusive_image_picker/src/interfaces/permissions_interface.dart';
import 'package:codeclusive_image_picker/src/models/permission_exception.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_manager/photo_manager.dart';

/// Repository used for requesting or reading permissions related to device gallery
class PermissionRepository implements PermissionsInterface {
  /// Request storage permissions. *Required for Android SDK < 33*
  ///
  /// When error occurs this method throws [PermissionRequestException]
  @override
  Future<PermissionStatus> get getStoragePermissionsAndroid async {
    try {
      return await Permission.storage.request();
    } catch (s, e) {
      throw PermissionRequestException('[Error while requesting storage permissions. Error: $e, stackTrace: $s');
    }
  }

  /// Request photos permissions. *Required for Android SDK >= 33*
  ///
  /// When error occurs this method throws [PermissionRequestException]
  @override
  Future<PermissionStatus> get getPhotosPermissionsAndroid async {
    try {
      return await Permission.photos.request();
    } catch (s, e) {
      throw PermissionRequestException('Error while requesting photos permissions. Error: $e, stackTrace: $s');
    }
  }

  /// Request photos permissions. *Required for IOS*
  ///
  /// When error occurs this method throws [PermissionRequestException]
  @override
  Future<PermissionState> get getPermissionsIOS async {
    try {
      return await PhotoManager.requestPermissionExtend();
    } catch (s, e) {
      throw PermissionRequestException('Error while requesting photos permissions. Error: $e, stackTrace: $s');
    }
  }

  /// Returns current permission status
  @override
  Future<PermissionStatus> getHandlerStatus(Permission permission) => permission.status;

  /// Returns current permission state
  ///
  /// When error occurs this method throws [PermissionStateException]
  @override
  bool getPermissionState(PermissionState? permissionState) {
    try {
      if (permissionState == null) return false;
      return permissionState.hasAccess;
    } catch (s, e) {
      throw PermissionStateException('Error while getting permission state. Error: $e, stackTrace: $s');
    }
  }

  /// Opens system app settings
  ///
  /// When error occurs this method throws [PermissionRequestException]
  @override
  Future<void> goToSettings() async {
    try {
      await PhotoManager.openSetting();
    } catch (s, e) {
      throw PermissionRequestException('Error while opening system setting page. Error: $e, stackTrace: $s');
    }
  }
}
