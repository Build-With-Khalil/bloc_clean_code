import 'package:bloc/bloc.dart';
import 'package:bloc_clean_code/bloc/image_picker/image_picker_event.dart';
import 'package:bloc_clean_code/bloc/image_picker/image_picker_state.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/image_picker_utils.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  /// Image picker utils
  final ImagePickerUtils _imagePickerUtils;

  /// Image picker bloc
  ImagePickerBloc(this._imagePickerUtils) : super(ImagePickerState()) {
    on<CameraCapture>(cameraCapture);
    on<GalleryImagePicker>(galleryImagePicker);
  }

  /// Camera capture
  void cameraCapture(
    ImagePickerEvent event,
    Emitter<ImagePickerState> emit,
  ) async {
    final XFile? file = await _imagePickerUtils.clickImageWithCamera();
    emit(state.copyWith(file: file));
  }

  /// Gallery image picker
  void galleryImagePicker(
    ImagePickerEvent event,
    Emitter<ImagePickerState> emit,
  ) async {
    final XFile? file = await _imagePickerUtils.pickImageFromGallery();
    emit(state.copyWith(file: file));
  }
}
