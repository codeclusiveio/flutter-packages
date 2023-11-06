import 'package:codeclusive_image_picker/repositories/codeclusive_image_picker_repository.dart';
import 'package:photo_manager/photo_manager.dart';

class CodeclusiveImagePickerService {
  final CodeclusiveImagePickerRepository _codeclusiveImagePickerRepository;
  CodeclusiveImagePickerService(this._codeclusiveImagePickerRepository);

  Future<List<AssetPathEntity>> fetchAlbums() async {
    final albums = await _codeclusiveImagePickerRepository.fetchAlbumList();
    return albums;
  }

  Future<List<AssetEntity>?> fetchImagesFromAlbum(AssetPathEntity albums, int currentPage) async {
    final media = await albums.getAssetListPaged(size: 60, page: currentPage);
    if (media.isEmpty && currentPage == 0) {
      return null;
    }
    return media;
  }

  Future<List<AssetEntity>?> fetchAllImages() async {
    final albums = await _codeclusiveImagePickerRepository.fetchAlbumList();
    final List<AssetEntity> images = [];
    if (albums.isEmpty) {
      return null;
    }

    for (final album in albums) {
      final imagesCount = await album.assetCountAsync;
      if (imagesCount != 0) {
        final imagesToAdd = await album.getAssetListRange(start: 0, end: imagesCount);
        images.addAll(imagesToAdd);
      }
    }
    return images;
  }

  Future<int> getImagesCount({AssetPathEntity? album}) async {
    if (album != null) {
      return await album.assetCountAsync;
    }
    return await _codeclusiveImagePickerRepository.getImagesCount();
  }
}
