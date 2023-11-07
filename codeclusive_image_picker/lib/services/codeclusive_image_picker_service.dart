import 'package:codeclusive_image_picker/repositories/codeclusive_image_picker_repository.dart';
import 'package:photo_manager/photo_manager.dart';

/// This service is responsible for operations on a data acquired from [CodeclusiveImagePickerRepository]
class CodeclusiveImagePickerService {
  late final CodeclusiveImagePickerRepository _codeclusiveImagePickerRepository;

  CodeclusiveImagePickerService() {
    _codeclusiveImagePickerRepository = CodeclusiveImagePickerRepository();
  }

  /// This method returns [List]<[AssetPathEntity]> containing all albums stored on a device
  Future<List<AssetPathEntity>> fetchAlbums() async => await _codeclusiveImagePickerRepository.fetchAlbumList();

  /// This method returns [List]<[AssetEntity]> containing all images in specified album
  ///
  /// it takes one parameter:
  ///
  /// - [AssetPathEntity] album - specifies from witch album photos should be fetched
  Future<List<AssetEntity>> fetchImagesFromAlbum(AssetPathEntity album) async {
    final imagesCount = await album.assetCountAsync;
    final media = await album.getAssetListPaged(size: imagesCount, page: 0);
    if (media.isEmpty) {
      return [];
    }
    return media;
  }

  /// This method returns paginated [List]<[AssetEntity]> containing portion of images in specified album
  ///
  /// it takes three parameters:
  ///
  /// - [AssetPathEntity] album - specifies from witch album photos should be fetched
  /// -  [int] page - specify result page
  /// -  [int]? maxBatchSize - specify maximum size of returned images list
  Future<List<AssetEntity>> fetchPaginatedImages(
    AssetPathEntity album,
    int page, {
    int? maxBatchSize,
  }) async =>
      await album.getAssetListPaged(page: page, size: maxBatchSize ?? 30);

  /// This method returns paginated [List]<[AssetEntity]> containing all of images from device
  Future<List<AssetEntity>> fetchAllImages() async {
    final albums = await _codeclusiveImagePickerRepository.fetchAlbumList();
    final List<AssetEntity> images = [];
    if (albums.isEmpty) {
      return [];
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

  /// This method returns number of images stored on the device
  ///
  /// if [AssetPathEntity] album parameter is not null then it returns number of images in specified album
  /// otherwise it return number of all images stored on the device
  Future<int> getImagesCount({AssetPathEntity? album}) async {
    if (album != null) {
      return await album.assetCountAsync;
    }
    return await _codeclusiveImagePickerRepository.getImagesCount();
  }
}
