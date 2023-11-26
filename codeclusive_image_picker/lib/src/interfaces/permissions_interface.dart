import 'package:permission_handler/permission_handler.dart';
import 'package:photo_manager/photo_manager.dart';

abstract class PermissionsInterface {
  Future<PermissionStatus> get getStoragePermissionsAndroid;
  Future<PermissionStatus> get getPhotosPermissionsAndroid;
  Future<PermissionStatus> getHandlerStatus(Permission permission);
  Future<PermissionState> get getPermissionsIOS;
  bool getPermissionState(PermissionState? permissionState);
  void goToSettings();
}
