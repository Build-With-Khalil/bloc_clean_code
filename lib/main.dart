import 'package:bloc_clean_code/bloc/counter/counter_bloc.dart';
import 'package:bloc_clean_code/bloc/image_picker/image_picker_bloc.dart';
import 'package:bloc_clean_code/bloc/switch/switch_bloc.dart';
import 'package:bloc_clean_code/bloc/todo/todo_bloc.dart';
import 'package:bloc_clean_code/ui/navigation_screen.dart';
import 'package:bloc_clean_code/utils/image_picker_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CounterBloc(),
        ),
        BlocProvider(
          create: (context) => SwitchBloc(),
        ),
        BlocProvider(
          create: (context) => ImagePickerBloc(ImagePickerUtils()),
        ),
        BlocProvider(
          create: (context) => TodoBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: NavigationScreen(),
      ),
    );
  }
}