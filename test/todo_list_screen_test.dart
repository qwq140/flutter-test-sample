import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_unit_test_sample/todo_list_screen.dart';

// 테스트 환경에서는 유저와의 인터렉션을 시뮬레이션 해야 한다.
// 테스트 환경에서는 상태가 변경되어도 자동으로 화면을 다시 그리지 않는다.
// pump() 또는 pumpAndSettle()을 사용하여 다시 그리기를 시뮬레이션 해야 한다.
// pump() : setState
// pumpAndSettle() : 애니메이션 끝날때까지 setState
void main() {
  testWidgets('add and remove a todo', (tester) async {
    // 위젯을 빌드
    await tester.pumpWidget(const MaterialApp(
      home: TodoListScreen(),
    ));

    // TextField에 hi를 입력
    await tester.enterText(find.byType(TextField), 'hi');

    // 추가 버튼을 클릭 (FloatingActionButton)
    await tester.tap(find.byType(FloatingActionButton));

    // 상태가 변경된 후 위젯을 리빌드
    await tester.pump();

    expect(find.text('hi'), findsOneWidget);

    // 해당 아이템을 지우기 위해 아이템을 스와이프
    // Offset(500, 0) : x좌표 500만큼 드래그
    await tester.drag(find.byType(Dismissible), const Offset(500, 0));

    // 애니메이션이 끝날때까지 위젯을 리빌드
    await tester.pumpAndSettle();

    expect(find.text('hi'), findsNothing);
  });
}