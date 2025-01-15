import 'package:bloc_clean_code/ui/counter/counter_screen.dart';
import 'package:bloc_clean_code/ui/image_pick/pick_image_screen.dart';
import 'package:bloc_clean_code/ui/post/post_screen.dart';
import 'package:bloc_clean_code/ui/switch/switch_example_screen.dart';
import 'package:bloc_clean_code/ui/todo/to_do_screen/to_do_screen.dart';
import 'package:flutter/material.dart';

import 'favourite/favourite_screen.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CounterScreen(),
                  ),
                );
              },
              child: Text("Counter"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SwitchExampleScreen(),
                  ),
                );
              },
              child: Text("Switch"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PickImageScreen(),
                  ),
                );
              },
              child: Text("ImagePicker"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ToDoScreen(),
                  ),
                );
              },
              child: Text("todo"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FavouriteScreen(),
                  ),
                );
              },
              child: Text("Favourite"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PostScreen(),
                  ),
                );
              },
              child: Text("Post API"),
            ),
          ],
        ),
      ),
    );
  }
}
