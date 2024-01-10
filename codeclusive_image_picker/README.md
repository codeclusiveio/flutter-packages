Codeclusive Image Picker is a package created by Codeclusive.io team. It was developed for managing permissions and picking images more convenient way. 


## Getting started

### Requirements
- Flutter 3.13.9
- Dart 3.1.5

### Preparations 
To import cc_image_picker please add following line to the pubspec.yaml:

```dependencies:
codeclusive_image_picker: ^0.0.1
```

The app also should be able to request permissions. To do that please add proper permissions inside ```./android/app/src/main/AndroidManifest.xml```:
```
<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
<uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />
```

and also to the ```./ios/Runner/Info.plist```
```
<key>NSCameraUsageDescription</key>
<string>This allows You to take pictures inside your app</string>
<key>NSPhotoLibraryAddUsageDescription</key>
<string>This allows You to save photos captured in the app to your image gallery</string>
<key>NSPhotoLibraryUsageDescription</key>
<string>This allows You to upload pictures from your gallery</string>
```

### Usage
To use ```codeclusive_image_picker``` please use instance of ```CCImagePicker``` class which contains all of the necessary functionalities of this package. 
To declare ```CCImagePicker``` just simply add: ``` final CCImagePicker imagePicker = CCImagePicker();``` to your code.

### Example usage
Getting and printing all of the albums from device gallery:
```
...
CCImagePicker codeclusiveImagePicker = CCImagePicker();

final albums = await codeclusiveImagePicker.getAlbums();
print(albums.toString());
...
```

Requesting gallery permissions and navigating to the system app settings when permissions are ```denied``` or ```permanentlyDenied```:
```
...
CCImagePicker codeclusiveImagePicker = CCImagePicker();

await codeclusiveImagePicker.requestPermissions().then((value) {
  if (value.isPermanentlyDenied || value.isDenied) {
    codeclusiveImagePicker.goToAppSettings();
  }
}
...
```

## Features

- ```requestPermissions()``` - request permissions required for fetching data from device gallery
- ```getPermissionStatus()``` - get current permissions status
- ```goToAppSettings()``` - open app system settings
- ```getAlbums()``` - get list of albums stored on the device
- ```getImagesFromAlbum(AssetPathEntity album)``` - get list of images from specified album
- ```getImagesFromAlbumPaginated(AssetPathEntity album, int page, {int? maxBatchSize = 30)``` - get paginated images list from album. Can specify maximum batch size of page.
- ```getAllImages()``` - get all of the images from the device
  
## License
Copyright (c) 2023, Codeclusive. Use of this source code is governed by a MIT license that can be found in the LICENSE file.