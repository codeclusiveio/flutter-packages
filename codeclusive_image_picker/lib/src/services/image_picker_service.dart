import 'package:codeclusive_image_picker/src/models/image_picker_exception.dart';
import 'package:codeclusive_image_picker/src/repositories/image_picker_repository.dart';
import 'package:photo_manager/photo_manager.dart';

/// This service is responsible for operations on a data acquired from [ImagePickerRepository]
class ImagePickerService {
  late final ImagePickerRepository _codeclusiveImagePickerRepository;

  ImagePickerService() {
    _codeclusiveImagePickerRepository = ImagePickerRepository();
  }

  /// This method returns [List]<[AssetPathEntity]> containing all albums stored on a device
  Future<List<AssetPathEntity>> fetchAlbums() async => await _codeclusiveImagePickerRepository.fetchAlbumList();

  /// This method returns [List]<[AssetEntity]> containing all images in specified album
  ///
  /// it takes one parameter:
  ///
  /// - [AssetPathEntity] album - specifies from which album photos should be fetched
  ///
  /// When error occurs this method throws [GalleryScanException]
  Future<List<AssetEntity>> fetchImagesFromAlbum(AssetPathEntity album) async {
    try {
      final imagesCount = await album.assetCountAsync;
      print('wiktor-log ic: $imagesCount');
      if (imagesCount > 0) {
        final media = await album.getAssetListPaged(size: imagesCount, page: 0);

        if (media.isEmpty) {
          return [];
        }
        return media;
      }
      return [];
    } catch (e, s) {
      throw GalleryScanException('Error while fetching images from album: ${album.name}. Error: $e, stackTrace: $s');
    }
  }

  /// This method returns paginated [List]<[AssetEntity]> containing portion of images in specified album
  ///
  /// it takes three parameters:
  ///
  /// - [AssetPathEntity] album - specifies from which album photos should be fetched
  /// -  [int] page - specify result page
  /// -  [int]? maxBatchSize - specify maximum size of returned images list
  ///
  /// When error occurs this method throws [GalleryScanException]
  Future<List<AssetEntity>> fetchPaginatedImages(
    AssetPathEntity album,
    int page, {
    int? maxBatchSize,
  }) async {
    try {
      return await album.getAssetListPaged(page: page, size: maxBatchSize ?? 30);
    } catch (e, s) {
      throw GalleryScanException(
          'Error while fetching paginated images from album: ${album.name}. Error: $e, stackTrace: $s');
    }
  }

  /// This method returns paginated [List]<[AssetEntity]> containing all of images from device
  ///
  /// When error occurs this method throws [GalleryScanException]
  Future<List<AssetEntity>> fetchAllImages() async {
    try {
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
    } catch (e, s) {
      throw GalleryScanException('Error while fetching all images. Error: $e, stackTrace: $s');
    }
  }

  /// This method returns number of images stored on the device
  ///
  /// if [AssetPathEntity] album parameter is not null then it returns number of images in specified album
  /// otherwise it return number of all images stored on the device
  ///
  /// When error occurs this method throws [GalleryScanException]
  Future<int> getImagesCount({AssetPathEntity? album}) async {
    try {
      if (album != null) {
        return await album.assetCountAsync;
      }
      return await _codeclusiveImagePickerRepository.getImagesCount();
    } catch (e, s) {
      throw GalleryScanException(
          'Error while getting images count${album != null ? ' from album: ${album.name}' : ''}. Error: $e, stackTrace: $s');
    }
  }
}
