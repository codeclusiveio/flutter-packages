import 'package:codeclusive_image_picker/use_cases/codeclusive_image_picker_use_case.dart';
import 'package:example/single_image_view.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler_platform_interface/permission_handler_platform_interface.dart';
import 'package:photo_manager/photo_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Codeclusive Image Picker example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Codeclusive Image Picker example page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _statistics = 'Click button to show statistics';
  String _permissions = 'Click button to check permissions';
  List<AssetEntity> _images = [];

  CCImagePicker codeclusiveImagePickerUseCase = CCImagePicker();

  void _showGalleryStatistics(List<AssetPathEntity> albums, List<AssetEntity> images) {
    setState(() {
      _statistics = albums.map((e) => e.name).toString();
      _images = images;
    });
  }

  void _showPermissionsSettings(bool permissions) {
    setState(() {
      _permissions = permissions.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Permissions: $_permissions',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 32,
              ),
              Text(
                _statistics,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 32,
              ),
              _images.isNotEmpty
                  ? SizedBox(
                      width: 400,
                      height: 400,
                      child: GridView.builder(
                        itemCount: _images.length,
                        itemBuilder: (context, index) => SingleImageView(asset: _images[index]),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                        ),
                      ))
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () async {
              final albums = await codeclusiveImagePickerUseCase.getAlbums();
              final images = await codeclusiveImagePickerUseCase.getImagesFromAlbum(albums[0], 0);
              _showGalleryStatistics([albums[0]], images);
            },
            tooltip: 'Scan gallery',
            child: const Icon(Icons.sync),
          ),
          const SizedBox(
            width: 16,
          ),
          FloatingActionButton(
            onPressed: () async {
              final albums = await codeclusiveImagePickerUseCase.getAlbums();
              final images = await codeclusiveImagePickerUseCase.getAllImages();
              _showGalleryStatistics(albums, images);
            },
            tooltip: 'Scan gallery',
            child: const Icon(Icons.all_inclusive),
          ),
          const SizedBox(
            width: 16,
          ),
          FloatingActionButton(
            onPressed: () async {
              await codeclusiveImagePickerUseCase.requestPermissions().then((value) {
                if (value != null && value.isPermanentlyDenied || value!.isDenied) {
                  codeclusiveImagePickerUseCase.goToAppSettings();
                }

                _showPermissionsSettings(value.isGranted);
                return value;
              });
            },
            tooltip: 'Check permissions',
            child: const Icon(Icons.security),
          ),
        ],
      ),
    );
  }
}
