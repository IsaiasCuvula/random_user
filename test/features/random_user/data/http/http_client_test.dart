import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:random_user/core/core.dart';
import 'package:random_user/features/random_user/random_user.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  late MockClient mockClient;
  late UserHttpClient userHttpClient;
  late String url;

  setUpAll(() {
    mockClient = MockClient();
    userHttpClient = UserHttpClientImpl(client: mockClient);
    url = ApiUrls.randomUserBaseUrl;
    registerFallbackValue(Uri.parse(url));
  });
  group('http client ...', () {
    final headers = {
      'content-type': 'application/json',
      'accept': 'application/json',
    };
    test('Should make successful HTTP request', () async {
      //Arrange
      when(() => mockClient.get(any(), headers: headers)).thenAnswer(
        (_) async => http.Response(fixture('random_user.json'), 200),
      );

      //Act
      await userHttpClient.request(url: url);

      //Assert
      verify(
        () => mockClient.get(Uri.parse(url), headers: headers),
      ).called(1);
    });

    test('Should return null for non-200 response', () async {
      //Arrange
      when(
        () => mockClient.get(any(), headers: headers),
      ).thenAnswer(
        (_) async => http.Response(fixture('server_error.json'), 404),
      );

      //Act
      final result = await userHttpClient.request(url: url);

      //Assert
      expect(result, isNull);
    });
  });
}
