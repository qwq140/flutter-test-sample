import 'package:flutter/material.dart';
import 'package:flutter_unit_test_sample/counter.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  late Counter counter;

  @override
  void initState() {
    super.initState();
    counter = Counter();
  }

  void increment() {
    setState(() {
      counter.increment();
    });
  }

  void decrement() {
    setState(() {
      counter.decrement();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              key: const Key('increment'),
              onPressed: increment,
              child: const Text('증가'),
            ),
            Text('${counter.value}'),
            ElevatedButton(
              key: const Key('decrement'),
              onPressed: decrement,
              child: const Text('감소'),
            ),
          ],
        ),
      ),
    );
  }
}
