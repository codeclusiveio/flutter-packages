import 'package:codeclusive_image_picker/interfaces/codeclusive_permissions_interface.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_manager/photo_manager.dart';

/// Repository used for requesting or reading permissions related to device gallery
class CodeclusivePermissionRepository implements CodeclusivePermissionsInterface {
  /// Request storage permissions. *Required for Android SDK < 33*
  @override
  Future<PermissionStatus> get getStoragePermissionsAndroid => Permission.storage.request();

  /// Request photos permissions. *Required for Android SDK >= 33*
  @override
  Future<PermissionStatus> get getPhotosPermissionsAndroid => Permission.photos.request();

  /// Request photos permissions. *Required for IOS*
  @override
  Future<PermissionState> get getPermissionsIOS => PhotoManager.requestPermissionExtend();

  /// Returns current permission status
  @override
  Future<PermissionStatus> getHandlerStatus(Permission permission) => permission.status;

  /// Returns current permission state
  @override
  bool getPermissionState(PermissionState? permissionState) {
    if (permissionState == null) return false;
    return permissionState.hasAccess;
  }

  /// Opens system app settings
  @override
  Future<void> goToSettings() async {
    await PhotoManager.openSetting();
  }
}
