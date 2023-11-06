import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

class SingleImageView extends StatefulWidget {
  const SingleImageView({
    Key? key,
    required this.asset,
  }) : super(key: key);

  final AssetEntity asset;

  @override
  State<SingleImageView> createState() => _SingleImageViewState();
}

class _SingleImageViewState extends State<SingleImageView> with SingleTickerProviderStateMixin {
  late Future<Uint8List?> imageFuture;

  @override
  void initState() {
    imageFuture = widget.asset.thumbnailDataWithSize(const ThumbnailSize.square(200), quality: 20);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: imageFuture,
        builder: (BuildContext context, AsyncSnapshot<Uint8List?> snapshot) {
          if (snapshot.hasError) {
            return const SizedBox.shrink();
          }
          if (snapshot.hasData) {
            final image = snapshot.data;
            if (image == null) {
              return const SizedBox.shrink();
            }
            return SizedBox(width: 50, height: 50, child: Image.memory(image, fit: BoxFit.cover));
          }

          return const SizedBox.shrink();
        });
  }
}
