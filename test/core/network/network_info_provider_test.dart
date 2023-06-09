import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:random_user/core/core.dart';

void main() {
  late ProviderContainer providerContainer;

  setUpAll(() {
    providerContainer = ProviderContainer();
  });

  tearDown(() {
    providerContainer.dispose();
  });

  test('NetworkInfoProvider should returns an instance of NetworkInfo...', () {
    //arrange

    //act
    final result = providerContainer.read(networkInfoProvider);

    //assert
    expect(result, isA<NetworkInfo>());
  });
}
