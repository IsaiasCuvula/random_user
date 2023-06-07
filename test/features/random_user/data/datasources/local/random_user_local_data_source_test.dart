import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:random_user/core/core.dart';
import 'package:random_user/features/random_user/random_user.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class LocalDataSourceMock extends Mock
    implements RandomUserLocalDataSourceImpl {}

void main() {
  late Database database;
  late LocalDataSourceMock localDataSourceMock;

  const tRandomUserModel = RandomUserModel(
      gender: 'male',
      nat: 'ao',
      phone: '+244 908654734',
      email: 'isaias@cuvula.ao');

  final tListUsers = List.generate(10, (index) => tRandomUserModel);

  setUpAll(() async {
    sqfliteFfiInit();
    database = await databaseFactoryFfi.openDatabase(
      inMemoryDatabasePath,
      options: OpenDatabaseOptions(
        version: DbConstants.databaseVersion,
      ),
    );
    await database.execute(DbConstants.createTableQuery);
    localDataSourceMock = LocalDataSourceMock();
    localDataSourceMock.db = database;
  });

  group('Database ...', () {
    test('Should return database version', () async {
      //arrange
      const dbVersion = DbConstants.databaseVersion;

      //act
      final result = await database.getVersion();

      //assert
      expect(result, dbVersion);
    });

    test('Should add successfully a RandomUser to database', () async {
      //arrange
      final tSerializedUser = UserMapper.toJson(tRandomUserModel);

      //act - insert method in sql return 1 if success or 0 if not
      final result =
          await database.insert(DbConstants.tableName, tSerializedUser);

      //assert
      expect(result, equals(1));
    });

    test(
        'Should fail if trying to insert the same user more than once into the database',
        () async {
      //arrange
      final tSerializedUser = UserMapper.toJson(tRandomUserModel);

      //act - insert method in sql return 1 if success or 0 if not
      await database.insert(DbConstants.tableName, tSerializedUser);
      final result = await database.insert(
        DbConstants.tableName,
        tSerializedUser,
      );

      //assert
      expect(result, isNot(1));
    });

    test('Should close database', () async {
      //arrange

      //act
      await database.close();

      //assert
      expect(database.isOpen, isFalse);
    });
  });

  group('random user local data source ...', () {
    test('cacheRandomUser() Should cache a RandomUser', () async {
      //arrange
      when(
        () => localDataSourceMock.cacheRandomUser(tRandomUserModel),
      ).thenAnswer((_) async => 1);

      verifyNever(
        () => localDataSourceMock.cacheRandomUser(tRandomUserModel),
      );

      //act
      final result = await localDataSourceMock.cacheRandomUser(
        tRandomUserModel,
      );

      //assert
      expect(result, equals(1));

      verify(() => localDataSourceMock.cacheRandomUser(tRandomUserModel))
          .called(1);
    });

    test('getLastRandomUser() Should return a random user from database',
        () async {
      //arrange
      when(localDataSourceMock.getLastRandomUser).thenAnswer(
        (_) async => tRandomUserModel,
      );
      //act
      verifyNever(localDataSourceMock.getLastRandomUser);
      final result = await localDataSourceMock.getLastRandomUser();

      //assert
      expect(result, tRandomUserModel);
      verify(localDataSourceMock.getLastRandomUser);
    });

    test(
        'getAllCachedRandomUsers() Should return a list of random users from database',
        () async {
      //arrange
      when(localDataSourceMock.getAllCachedRandomUsers).thenAnswer(
        (_) async => tListUsers,
      );
      //act
      verifyNever(localDataSourceMock.getAllCachedRandomUsers);
      final result = await localDataSourceMock.getAllCachedRandomUsers();

      //assert
      expect(result, tListUsers);
      verify(localDataSourceMock.getAllCachedRandomUsers);
    });
  });
}
