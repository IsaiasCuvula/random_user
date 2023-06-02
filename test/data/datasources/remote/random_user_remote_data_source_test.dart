import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:random_user/data/data.dart';

class RandomUserRemoteDataSourceMock extends Mock
    implements RandomUserRemoteDataSourceImpl {}

void main() {
  late RandomUserRemoteDataSourceMock dataSourceMock;
  late RandomUserModel tRandomUser;
  final List<RandomUserModel> tRandomUsersList = [];
  late Exception exception;
  setUp(() {
    dataSourceMock = RandomUserRemoteDataSourceMock();
    tRandomUser = const RandomUserModel(
      gender: 'male',
      nat: 'ao',
      phone: '+24490876574',
      email: 'bersyte@bersyte.ao',
    );
    tRandomUsersList.add(tRandomUser);
    exception = Exception('Testing Exception');
  });

  group('Getting random user', () {
    test('Should return a random user', () async {
      // Arrange
      when(() => dataSourceMock.getRandomUser()).thenAnswer(
        (_) async => tRandomUser,
      );
      //Act
      final result = await dataSourceMock.getRandomUser();
      //Assert
      expect(result, tRandomUser);
      verify(() => dataSourceMock.getRandomUser());
    });

    test('Should throw an exception if something go wrong in the server',
        () async {
      // Arrange
      when(() => dataSourceMock.getRandomUser()).thenThrow(exception);

      //Act & Assert
      expect(
        () => dataSourceMock.getRandomUser(),
        throwsA(isA<Exception>()),
      );
      verify(() => dataSourceMock.getRandomUser());
    });
  });

  group('getListOfRandomUsers', () {
    const numberOfRandomUsers = 1;
    test('Should return a list of random users', () async {
      when(() => dataSourceMock.getListOfRandomUsers(numberOfRandomUsers))
          .thenAnswer(
        (_) async => tRandomUsersList,
      );

      final result = await dataSourceMock.getListOfRandomUsers(
        numberOfRandomUsers,
      );

      expect(result, tRandomUsersList);
      verify(() => dataSourceMock.getListOfRandomUsers(numberOfRandomUsers));
    });

    test('Should throw an exception if something go wrong in the server',
        () async {
      // Arrange
      when(() => dataSourceMock.getListOfRandomUsers(numberOfRandomUsers))
          .thenThrow(exception);

      //Act & Assert
      expect(
        () => dataSourceMock.getListOfRandomUsers(
          numberOfRandomUsers,
        ),
        throwsA(isA<Exception>()),
      );
      verify(
        () => dataSourceMock.getListOfRandomUsers(
          numberOfRandomUsers,
        ),
      );
    });
  });
}
