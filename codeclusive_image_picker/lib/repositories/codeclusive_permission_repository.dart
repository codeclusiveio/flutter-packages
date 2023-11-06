import 'package:codeclusive_image_picker/interfaces/codeclusive_permissions_interface.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_manager/photo_manager.dart';

class CodeclusivePermissionRepository implements CodeclusivePermissionsInterface {
  @override
  Future<PermissionStatus> getStoragePermissionsAndroid() => Permission.storage.request();

  @override
  Future<PermissionStatus> getPhotosPermissionsAndroid() => Permission.photos.request();

  @override
  Future<PermissionStatus> getHandlerStatus(Permission permission) => permission.status;

  @override
  Future<PermissionState> getPermissionsIOS() => PhotoManager.requestPermissionExtend();

  @override
  bool getPhotoManagerStatus(PermissionState? permissionState) {
    if (permissionState == null) return false;
    return permissionState.hasAccess;
  }

  @override
  void goToSettings() {
    PhotoManager.openSetting();
  }
}
