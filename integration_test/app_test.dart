// 선 작업(의존성 추가)
//   integration_test:
//     sdk: flutter

// 1. IntegrationTestWidgetsFlutterBinding 초기화
// 2. WidgetTester 클래스를 사용하여 위젯고 상호작용하고 테스트
// 3. 중요한 시나리오 테스트
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_unit_test_sample/counter_screen.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('증가 및 감소 버튼 클릭, 카운터 검증', (tester) async {
      // 위젯 불러오기
      await tester.pumpWidget(const MaterialApp(
        home: CounterPage(),
      ));

      // 카운터가 0부터 시작하는지 검증
      expect(find.text('0'), findsOneWidget);

      // 증가 버튼 찾기
      final incrementButton = find.byKey(const Key('increment'));

      // 증가 버튼 클릭
      await tester.tap(incrementButton);

      // 리빌드(setState)
      await tester.pumpAndSettle();

      // 카운터 값 검증
      expect(find.text('1'), findsOneWidget);

      // 감소 버튼 찾기
      final decrementButton = find.byKey(const Key('decrement'));

      // 감소 버튼 클릭
      await tester.tap(decrementButton);

      // 리빌드(setState)
      await tester.pumpAndSettle();

      // 카운터 값 검증
      expect(find.text('0'), findsOneWidget);
    });
  });
}