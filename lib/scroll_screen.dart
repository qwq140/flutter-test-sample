import 'package:flutter/material.dart';

class ScrollScreen extends StatelessWidget {
  final List<String> items;
  final String title;

  const ScrollScreen({super.key, required this.items, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        key: const Key('long_list'),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              items[index],
              key: Key('item_${index}_text'),
            ),
          );
        },
      ),
    );
  }
}
