import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:random_user/features/random_user/random_user.dart';
import '../../../../../fixtures/fixture_reader.dart';

class MockUserRepository extends Mock implements RandomUserRepository {}

void main() {
  late GetRandomUser usecase;
  late MockUserRepository mockUserRepository;
  late RandomUser tRandomUser;
  setUpAll(() {
    mockUserRepository = MockUserRepository();
    usecase = GetRandomUser(mockUserRepository);
    final userModel = UserMapper.fromJson(
      json.decode(fixture('random_user.json')),
    );
    tRandomUser = UserMapper.toEntity(userModel);
  });
  group('get random user ...', () {
    test('Should return a random user', () async {
      //arrange
      when(() => mockUserRepository.getRandomUser()).thenAnswer(
        (_) async => Right(tRandomUser),
      );

      //act
      final result = await usecase();

      //assert
      verify(() => mockUserRepository.getRandomUser());
      expect(result, Right(tRandomUser));
      verifyNoMoreInteractions(mockUserRepository);
    });
  });
}
