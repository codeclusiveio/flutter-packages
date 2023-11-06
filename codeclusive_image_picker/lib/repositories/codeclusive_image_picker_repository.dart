// ignore_for_file: library_private_types_in_public_api
import 'dart:math';

import 'package:photo_manager/photo_manager.dart';

/// TODO(Wiktor Androsiuk): refactor these methods
class CodeclusiveImagePickerRepository {
  late PhotoManagerWrapper? photoManagerWrapper;

  CodeclusiveImagePickerRepository({this.photoManagerWrapper}) {
    photoManagerWrapper ??= PhotoManagerWrapper();
  }

  Future<List<AssetPathEntity>> fetchAlbumList() async {
    if (photoManagerWrapper == null) return [];
    List<AssetPathEntity> albums = [];
    try {
      albums = await photoManagerWrapper!.getAssetPathList(
          type: RequestType.image,
          filterOption: FilterOptionGroup(
              imageOption: const FilterOption(needTitle: true)));
    } catch (e) {
      return [];
    }
    return albums.sublist(0, min(60, albums.length));
  }
}

class PhotoManagerWrapper {
  Future<List<AssetPathEntity>> getAssetPathList({
    bool hasAll = true,
    bool onlyAll = false,
    RequestType type = RequestType.common,
    FilterOptionGroup? filterOption,
  }) =>
      PhotoManager.getAssetPathList(
          type: type,
          hasAll: hasAll,
          onlyAll: onlyAll,
          filterOption: filterOption);
}
