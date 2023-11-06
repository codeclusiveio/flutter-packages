import 'dart:math';

import 'package:codeclusive_image_picker/interfaces/codeclusive_image_picker_interface.dart';
import 'package:photo_manager/photo_manager.dart';

class CodeclusiveImagePickerRepository implements CodeclusiveImagePickerInterface {
  CodeclusiveImagePickerRepository();

  Future<List<AssetPathEntity>> _getAssetPathList({
    bool hasAll = true,
    bool onlyAll = false,
    RequestType type = RequestType.common,
    FilterOptionGroup? filterOption,
  }) =>
      PhotoManager.getAssetPathList(type: type, hasAll: hasAll, onlyAll: onlyAll, filterOption: filterOption);

  Future<int> _getAssetCount() => PhotoManager.getAssetCount();

  @override
  Future<List<AssetPathEntity>> fetchAlbumList() async {
    List<AssetPathEntity> albums = [];
    try {
      albums = await _getAssetPathList(
        type: RequestType.image,
        filterOption: FilterOptionGroup(
          imageOption: const FilterOption(needTitle: true),
        ),
      );
    } catch (e) {
      return [];
    }
    return albums.sublist(0, min(60, albums.length));
  }

  @override
  Future<int> getImagesCount() async {
    int count = 0;
    try {
      count = await _getAssetCount();
    } catch (e) {
      return 0;
    }
    return count;
  }
}
