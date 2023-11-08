Codeclusive Image Picker is a package creaated by Codeclusive.io team. It was developed for managing permissions and picking images more convinient way. 

## Features

- ```requestPermissions()``` - request permissions required for fetching data from device gallery
- ```getPermissionStatus()``` - get current permissions status
- ```goToAppSettings()``` - open app system settings
- ```getAlbums()``` - get list of albums stored on the device
- ```getImagesFromAlbum(AssetPathEntity album)``` - get list of images from specified album
- ```getImagesFromAlbumPaginated(AssetPathEntity album, int page, {int? maxBatchSize = 30)``` - get paginated images list from album. Can specify maximum batch size of page.
- ```getAllImages()``` - get all of the images from the device
 
## Getting started

### Requirements
- Flutter 3.13.9
- Dart 3.1.5

## Usage
To use cc_image_picker please add following line to the proper files:

pubspec.yaml:
```dependencies:
codeclusive_image_picker:
    git:
        url: https://github.com/codeclusiveio/flutter-packages.git
        path: codeclusive_image_picker
        ref: TODO: Add proper ref
```
