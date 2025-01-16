import 'package:bloc_clean_code/bloc/counter/counter_bloc.dart';
import 'package:bloc_clean_code/bloc/favourite/favourite_bloc.dart';
import 'package:bloc_clean_code/bloc/image_picker/image_picker_bloc.dart';
import 'package:bloc_clean_code/bloc/post/post_api_bloc.dart';
import 'package:bloc_clean_code/bloc/switch/switch_bloc.dart';
import 'package:bloc_clean_code/bloc/todo/todo_bloc.dart';
import 'package:bloc_clean_code/repo/fav/fav_repo.dart';
import 'package:bloc_clean_code/repo/post_api_repo.dart';
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
        BlocProvider(
          create: (context) => FavouriteBloc(FavRepo()),
        ),
        BlocProvider(
          create: (context) => PostApiBloc(PostAPIRepo()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        darkTheme: ThemeData.dark(),
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: NavigationScreen(),
      ),
    );
  }
}
