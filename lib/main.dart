import 'package:flutter/material.dart';
import 'package:flutter_unit_test_sample/album_screen.dart';
import 'package:flutter_unit_test_sample/counter_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: CounterPage(),
      home: AlbumScreen(),
    );
  }
}
