import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ImageDatasource {
  final ImagePicker picker = ImagePicker();

  Future<File?> pickImage(bool fromGallery) async {
    try {
      // Tentukan permission berdasarkan sumber gambar
      final permission = fromGallery
          ? (Platform.isAndroid ? Permission.storage : Permission.photos)
          : Permission.camera;

      final status = await permission.request();

      if (!status.isGranted) {
        if (status.isPermanentlyDenied) {
          openAppSettings(); // buka settings
        }
        return null;
      }

      final XFile? pickedFile = await picker.pickImage(
        source: fromGallery ? ImageSource.gallery : ImageSource.camera,
      );

      if (pickedFile == null) throw Exception('No image selected');
      return File(pickedFile.path);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
