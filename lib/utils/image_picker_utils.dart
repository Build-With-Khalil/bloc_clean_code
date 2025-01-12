import 'package:image_picker/image_picker.dart';

class ImagePickerUtils {
  /// Image picker instance
  final ImagePicker _pickImage = ImagePicker();

  /// click image with camera
  Future<XFile?> clickImageWithCamera() async {
    final XFile? file = await _pickImage.pickImage(source: ImageSource.camera);
    return file;
  }

  /// Pick image from gallery
  Future<XFile?> pickImageFromGallery() async {
    final XFile? file = await _pickImage.pickImage(source: ImageSource.gallery);
    return file;
  }
}
