import 'package:flutter_test/flutter_test.dart';
import 'package:random_user/features/random_user/random_user.dart';

void main() {
  group('display info notifier ...', () {
    test('Should initialize with the provided info', () {
      //Arrange
      const name = 'bersyte';

      //Act
      final result = DisplayInfoNotifier(name);

      //Assert
      expect(result.state, name);
    });

    test('Should update the state with the provided info', () {
      //Arrange
      final notifier = DisplayInfoNotifier('');
      const info = 'bersyte@bern.ao';

      //Act
      notifier.updateInfo(info);

      //Assert
      expect(notifier.state, info);
    });
  });
}
