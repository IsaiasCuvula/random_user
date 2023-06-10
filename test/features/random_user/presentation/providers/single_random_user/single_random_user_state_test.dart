import 'package:flutter_test/flutter_test.dart';
import '../../../../../fixtures/fixture_reader.dart';
import 'dart:convert';
import 'package:random_user/features/random_user/random_user.dart';

void main() {
  late RandomUser tRandomUser;

  setUp(() {
    final userModel = UserMapper.fromJson(
      json.decode(fixture('random_user.json')),
    );

    tRandomUser = UserMapper.toEntity(userModel);
  });

  group('single random user state...', () {
    test('Should properly initiaze with provided values', () {
      //Arrange
      const isLoading = true;
      const errorMessage = 'Cache error';

      //Act
      final state = SingleRandomUserState(
        user: tRandomUser,
        isLoading: isLoading,
        errorMessage: errorMessage,
      );

      //Assert
      expect(state.user, tRandomUser);
      expect(state.isLoading, isLoading);
      expect(state.errorMessage, errorMessage);
    });

    test('should generate correct props list', () {
      //Arrange
      const isLoading = false;
      const errorMessage = 'Cache error';

      final state = SingleRandomUserState(
        user: tRandomUser,
        isLoading: isLoading,
        errorMessage: errorMessage,
      );
      //Act
      final props = state.props;

      //Assert
      expect(props.contains(state.user), isTrue);
      expect(props.contains(state.isLoading), isTrue);
      expect(props.contains(state.errorMessage), isTrue);
    });

    test('should return true for equality with the same properties', () {
      //Arrange
      const isLoading = true;
      const errorMessage = 'Cache error';

      final state1 = SingleRandomUserState(
        user: tRandomUser,
        isLoading: isLoading,
        errorMessage: errorMessage,
      );

      final state2 = SingleRandomUserState(
        user: tRandomUser,
        isLoading: isLoading,
        errorMessage: errorMessage,
      );

      //Act
      final result = state1 == state2;

      //Assert
      expect(result, isTrue);
    });

    test('should return false for inequality with different properties', () {
      //Arrange
      const isLoading1 = true;
      const isLoading2 = false;
      const errorMessage1 = 'Server error';
      const errorMessage2 = 'Cache error';

      final state1 = SingleRandomUserState(
        user: tRandomUser,
        isLoading: isLoading1,
        errorMessage: errorMessage1,
      );

      final state2 = SingleRandomUserState(
        user: tRandomUser,
        isLoading: isLoading2,
        errorMessage: errorMessage2,
      );

      //Act
      final result = state1 != state2;

      //Assert
      expect(result, isTrue);
    });
  });
}
