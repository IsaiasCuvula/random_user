import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:random_user/features/random_user/random_user.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  late ProviderContainer providerContainer;
  late MockClient client;
  late UserHttpClient userHttpClient;

  setUpAll(() async {
    providerContainer = ProviderContainer();
    client = MockClient();
    userHttpClient = UserHttpClientImpl(client: client);
  });

  tearDown(() {
    providerContainer.dispose();
  });

  test(
      'RandomUserRemoteDataSourceProvider should returns an instance of RandomUserRemoteDataSource...',
      () {
    //arrange

    //act
    final result = providerContainer.read(
      randomUserRemoteDataSourceProvider(userHttpClient),
    );

    //assert
    expect(result, isA<RandomUserRemoteDataSource>());
  });
}
