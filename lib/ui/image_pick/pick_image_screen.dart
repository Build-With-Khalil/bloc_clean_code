import 'dart:io';

import 'package:bloc_clean_code/bloc/image_picker/image_picker_bloc.dart';
import 'package:bloc_clean_code/bloc/image_picker/image_picker_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/image_picker/image_picker_event.dart';

class PickImageScreen extends StatelessWidget {
  const PickImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Pick Image Screen'),
        ),
        body: Center(
          child: BlocBuilder<ImagePickerBloc, ImagePickerState>(
            builder: (context, state) {
              return state.file == null
                  ? InkWell(
                      onTap: () {
                        context.read<ImagePickerBloc>().add(
                              GalleryImagePicker(),
                            );
                      },
                      child: CircleAvatar(
                        child: Icon(Icons.camera),
                      ),
                    )
                  : Image.file(File(state.file!.path.toString()));
            },
          ),
        ));
  }
}
