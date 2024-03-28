import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_unit_test_sample/home_screen.dart';

void main() {
  testWidgets('title, message를 표시한다', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: HomeScreen(title: 'T', message: 'M'),
      ),
    );

    // T 글자가 있는 객체
    final titleFinder = find.text('T');
    // M 글자가 있는 객체
    final messageFinder = find.text('M');

    // 각각 1개씩 있는지 검사
    expect(titleFinder, findsOneWidget);
    expect(messageFinder, findsOneWidget);
  });
}
