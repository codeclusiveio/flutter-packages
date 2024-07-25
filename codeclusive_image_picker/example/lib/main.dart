import 'dart:io';

import 'package:codeclusive_image_picker/cc_image_picker.dart';
import 'package:example/single_image_view.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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
      title: 'CC Image Picker example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'CC Image Picker example page'),
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
  XFile? _cameraImage;

  CCImagePicker codeclusiveImagePicker = CCImagePicker();

  void _showGalleryStatistics(
      List<AssetPathEntity> albums, List<AssetEntity> images) {
    setState(() {
      _statistics = 'Selected albums: ${albums.map((e) => e.name).toString()}';
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
              const SizedBox(height: 32),
              Text(
                _statistics,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 32),
              if (_cameraImage != null) const Text('Taken image from camera:'),
              if (_cameraImage != null)
                SizedBox(
                  height: 200,
                  child: Image.file(
                    File(_cameraImage!.path),
                    fit: BoxFit.contain,
                  ),
                ),
              _images.isNotEmpty
                  ? SizedBox(
                      width: 400,
                      height: 400,
                      child: GridView.builder(
                        itemCount: _images.length,
                        itemBuilder: (context, index) =>
                            SingleImageView(asset: _images[index]),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
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
              final takenPhoto = await codeclusiveImagePicker.takePhoto();
              setState(() {
                _cameraImage = takenPhoto;
              });
            },
            child: const Icon(Icons.camera),
          ),
          const SizedBox(width: 16),
          FloatingActionButton(
            onPressed: () async {
              final albums = await codeclusiveImagePicker.getAlbums();
              final images =
                  await codeclusiveImagePicker.getImagesFromAlbum(albums[0]);
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
              final albums = await codeclusiveImagePicker.getAlbums();
              final images = await codeclusiveImagePicker.getAllImages();
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
              await codeclusiveImagePicker.requestPermissions().then((value) {
                if (value.isPermanentlyDenied || value.isDenied) {
                  codeclusiveImagePicker.goToAppSettings();
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
