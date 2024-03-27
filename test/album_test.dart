import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_unit_test_sample/album.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'album_test.mocks.dart';

// MockClient 생성 (가짜 객체 생성)
// 각각의 테스트에 인스턴스를 생성
@GenerateMocks([http.Client])
void main() {
  // 테스트 조건
  // 1. http 호출 성공하여 Album을 반환
  // 2. http 호출 실패하여 예외 발생
  group('fetch album', () { 
    test('Album이 정상적으로 반환된어야 한다', () async {
      final client = MockClient();

      when(client
          .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1')))
          .thenAnswer((_) async =>
          http.Response('{"userId": 1, "id" : 1, "title" : "quidem molestiae enim"}', 200)
      );

      expect(await fetchAlbum(client), isA<Album>());
    });

    test('http 통신이 error가 발생하면 예외를 발생시켜야 한다', () {
      final client = MockClient();

      when(client
          .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1')))
          .thenAnswer((_) async =>
          http.Response('Not Found', 404)
      );

      expect(fetchAlbum(client), throwsException);
    });
  });
}