import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('finds a Text widget', (tester) async {
    tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: Text('H'),
      ),
    ));
  });

  testWidgets('finds a widget using a key', (tester) async {
    const testKey = Key('K');
    
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        key: testKey,
        body: Container(),
      ),
    ));

    expect(find.byKey(testKey), findsOneWidget);
  });

  testWidgets('finds a specific instance', (tester) async {
    const childWidget = Padding(padding: EdgeInsets.zero);

    await tester.pumpWidget(Container(child: childWidget));

    expect(find.byWidget(childWidget), findsOneWidget);
  });
}