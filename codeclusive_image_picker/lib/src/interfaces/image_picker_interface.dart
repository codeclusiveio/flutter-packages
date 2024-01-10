// Copyright (c) 2023, Codeclusive. Use of this source code is governed by a
// MIT license that can be found in the LICENSE file.

import 'package:photo_manager/photo_manager.dart';

abstract class ImagePickerInterface {
  Future<List<AssetPathEntity>> fetchAlbumList();
  Future<int> getImagesCount();
}
