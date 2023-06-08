import 'package:flutter_test/flutter_test.dart';
import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:random_user/features/random_user/random_user.dart';
import '../../../../../fixtures/fixture_reader.dart';

class MockUserRepository extends Mock implements RandomUserRepository {}

void main() {
  late GetListOfRandomUsers usecase;
  late MockUserRepository mockUserRepository;
  late RandomUser tRandomUser;
  setUpAll(() {
    mockUserRepository = MockUserRepository();
    usecase = GetListOfRandomUsers(mockUserRepository);
    final userModel = UserMapper.fromJson(
      json.decode(fixture('random_user.json')),
    );
    tRandomUser = UserMapper.toEntity(userModel);
  });
  group('get list of random users ...', () {
    test('Should return list of random users', () async {
      //arrange
      const number = 3;
      when(() => mockUserRepository.getListOfRandomUsers(any())).thenAnswer(
        (_) async => Right([tRandomUser]),
      );

      //act
      final result = await usecase(number);

      //assert
      verify(() => mockUserRepository.getListOfRandomUsers(any()));
      expect(result, isA<Right>());
      verifyNoMoreInteractions(mockUserRepository);
    });
  });
}
