import 'package:photo_manager/photo_manager.dart';

abstract class CodeclusiveImagePickerInterface {
  Future<List<AssetPathEntity>> fetchAlbumList();
  Future<int> getImagesCount();
}
