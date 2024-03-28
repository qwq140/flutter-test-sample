import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_unit_test_sample/scroll_screen.dart';

void main() {
  testWidgets('finds a deep item in a long list', (tester) async {
    // 1. build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: ScrollScreen(
        items: List<String>.generate(10000, (index) => 'Item $index'),
        title: 'Long List',
      ),
    ));

    final listFinder = find.byType(Scrollable);
    final itemFinder = find.byKey(const ValueKey('item_50_text'));

    // 해당 아이템이 나타날때까지 스크롤을 진행
    await tester.scrollUntilVisible(
      itemFinder,
      500.0,
      scrollable: listFinder,
    );

    expect(itemFinder, findsOneWidget);
  });
}
