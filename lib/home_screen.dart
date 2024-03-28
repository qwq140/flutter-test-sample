import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

  final String title;
  final String message;

  const HomeScreen({super.key, required this.title, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text(message),
      ),
    );
  }
}
