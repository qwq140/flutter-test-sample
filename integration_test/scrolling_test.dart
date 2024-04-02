import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_unit_test_sample/scroll_screen.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to end', () {
    testWidgets('스크롤 성능 측정', (tester) async {
      await tester.pumpWidget(MaterialApp(
        home: ScrollScreen(
          items: List<String>.generate(10000, (index) => 'Item $index'),
          title: 'Long List',
        ),
      ));

      final listFinder = find.byType(Scrollable);
      final itemFinder = find.byKey(const ValueKey('item_50_text'));

      await binding.traceAction(
        () async {
          await tester.scrollUntilVisible(
            itemFinder,
            500.0,
            scrollable: listFinder,
          );
        },
        reportKey: 'scrolling_timeline',
      );

      expect(itemFinder, findsOneWidget);
    });
  });
}
