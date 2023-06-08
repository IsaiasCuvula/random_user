import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:random_user/core/core.dart';
import 'package:random_user/features/random_user/random_user.dart';
import '../../../../../fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late UserHttpClient userHttpClient;
  late MockHttpClient mockHttpClient;
  late RandomUserRemoteDataSource remoteDataSource;
  late String url;

  setUpAll(() {
    url = ApiUrls.randomUserBaseUrl;
    registerFallbackValue(Uri.parse(url));
    mockHttpClient = MockHttpClient();
    userHttpClient = UserHttpClientImpl(client: mockHttpClient);
    remoteDataSource = RandomUserRemoteDataSourceImpl(
      httpClient: userHttpClient,
    );
  });
  group('random user remote data source ...', () {
    final headers = {
      'content-type': 'application/json',
      'accept': 'application/json',
    };
    test('Should return a random user', () async {
      //Arrange
      when(() => mockHttpClient.get(any(), headers: headers)).thenAnswer(
        (_) async => http.Response(fixture('random_user.json'), 200),
      );

      //Act
      final result = await remoteDataSource.getRandomUser();

      //Assert
      expect(result, isA<RandomUserModel>());
    });

    test('Should return list of random users', () async {
      //Arrange
      when(() => mockHttpClient.get(any(), headers: headers)).thenAnswer(
        (_) async => http.Response(fixture('random_user.json'), 200),
      );

      //Act
      final result = await remoteDataSource.getListOfRandomUsers(3);

      //Assert
      expect(result, isA<List<RandomUserModel>>());
    });
  });
}
