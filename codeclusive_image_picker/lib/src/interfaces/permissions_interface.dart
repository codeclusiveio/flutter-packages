// Copyright (c) 2024, Codeclusive. Use of this source code is governed by a
// MIT license that can be found in the LICENSE file.

import 'package:permission_handler/permission_handler.dart';
import 'package:photo_manager/photo_manager.dart';

abstract class PermissionsInterface {
  Future<PermissionStatus> get getStoragePermissionsAndroid;
  Future<PermissionState> get getPhotosPermissionsAndroid;
  Future<PermissionStatus> getHandlerStatus(Permission permission);
  Future<PermissionState> get getPermissionsIOS;
  bool getPermissionState(PermissionState? permissionState);
  void goToSettings();
}
