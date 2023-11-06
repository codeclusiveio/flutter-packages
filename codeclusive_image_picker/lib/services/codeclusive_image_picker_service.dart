import 'package:codeclusive_image_picker/interfaces/codeclusive_image_picker_interface.dart';
import 'package:codeclusive_image_picker/repositories/codeclusive_image_picker_repository.dart';
import 'package:photo_manager/photo_manager.dart';

class CodeclusiveImagePickerService implements CodeclusiveImagePickerInterface {
  final CodeclusiveImagePickerRepository _codeclusiveImagePickerRepository;
  CodeclusiveImagePickerService(this._codeclusiveImagePickerRepository);

  @override
  Future<List<AssetPathEntity>> fetchAlbums() async {
    final albums = await _codeclusiveImagePickerRepository.fetchAlbumList();
    return albums;
  }
}
