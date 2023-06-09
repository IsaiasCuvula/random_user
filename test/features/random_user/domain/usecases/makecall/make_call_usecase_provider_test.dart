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

  test(
      'makeCallUseCaseProvider should returns an instance of MakeCallUseCase...',
      () {
    //arrange

    //act
    final result = providerContainer.read(makeCallUseCaseProvider);

    //assert
    expect(result, isA<MakeCallUseCase>());
  });
}
