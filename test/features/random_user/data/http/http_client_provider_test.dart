import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_user/features/random_user/random_user.dart';

void main() {
  late ProviderContainer providerContainer;

  setUpAll(() async {
    providerContainer = ProviderContainer();
  });

  tearDown(() {
    providerContainer.dispose();
  });

  test('userHttpClientProvider should returns an instance of UserHttpClient...',
      () {
    //arrange

    //act
    final result = providerContainer.read(httpClientProvider);

    //assert
    expect(result, isA<UserHttpClient>());
  });
}
