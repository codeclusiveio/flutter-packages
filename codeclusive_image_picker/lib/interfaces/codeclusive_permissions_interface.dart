import 'package:permission_handler/permission_handler.dart';
import 'package:photo_manager/photo_manager.dart';

abstract class CodeclusivePermissionsInterface {
  Future<PermissionStatus> getStoragePermissionsAndroid();
  Future<PermissionStatus> getPhotosPermissionsAndroid();
  Future<PermissionStatus> getHandlerStatus(Permission permission);
  Future<PermissionState> getPermissionsIOS();
  bool getPhotoManagerStatus(PermissionState? permissionState);
  void goToSettings();
}
