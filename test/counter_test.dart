import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_unit_test_sample/counter.dart';

void main() {
  group('Counter Test', () {
    test('0으로 시작해야한다.', () {
      expect(Counter().value, 0);
    });

    test('value는 증가해야한다.', () {
      final counter = Counter();

      counter.increment();

      expect(counter.value, 1);
    });
    
    test('value는 감소해야한다.', () {
      final counter = Counter();

      counter.decrement();

      expect(counter.value, -1);
    });
  });
}