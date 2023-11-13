import 'package:photo_manager/photo_manager.dart';

abstract class ImagePickerInterface {
  Future<List<AssetPathEntity>> fetchAlbumList();
  Future<int> getImagesCount();
}
