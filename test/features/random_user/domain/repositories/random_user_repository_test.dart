import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:random_user/core/core.dart';
import 'package:random_user/features/random_user/random_user.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import '../../../../fixtures/fixture_reader.dart';

class MockLocalDataSource extends Mock
    implements RandomUserLocalDataSourceImpl {}

class MockHttpClient extends Mock implements http.Client {}

class MockConnectivity extends Mock implements Connectivity {}

void main() {
  late RandomUserRepository repository;
  late MockLocalDataSource mockLocalDataSource;
  late RandomUserRemoteDataSource remoteDataSource;
  late MockHttpClient mockHttpClient;
  late UserHttpClient httpClient;
  late NetworkInfo networkInfo;
  late MockConnectivity connectivity;
  late RandomUserModel tRandomUserModel;
  late String url;
  late Database database;

  Future<void> dbConfig() async {
    sqfliteFfiInit();
    database = await databaseFactoryFfi.openDatabase(
      inMemoryDatabasePath,
      options: OpenDatabaseOptions(
        version: DbConstants.databaseVersion,
      ),
    );
    await database.execute(DbConstants.createTableQuery);
    mockLocalDataSource = MockLocalDataSource();
    mockLocalDataSource.db = database;
  }

  setUpAll(() async {
    tRandomUserModel = UserMapper.fromJson(
      json.decode(fixture('random_user.json')),
    );
    //network
    connectivity = MockConnectivity();
    mockHttpClient = MockHttpClient();
    httpClient = UserHttpClientImpl(client: mockHttpClient);
    //local
    mockLocalDataSource = MockLocalDataSource();
    await dbConfig();

    //remote
    remoteDataSource = RandomUserRemoteDataSourceImpl(httpClient: httpClient);
    networkInfo = NetworkInfoImpl(connectivity: connectivity);

    //repository
    repository = RandomUserRepositoryImpl(
      localDataSource: mockLocalDataSource,
      networkInfo: networkInfo,
      remoteDataSource: remoteDataSource,
    );
  });

  group('random user repository ...', () {
    group('when device is online', () {
      late Map<String, String> headers;
      setUp(() async {
        url = ApiUrls.randomUserBaseUrl;
        registerFallbackValue(Uri.parse(url));
        registerFallbackValue(tRandomUserModel);

        headers = {
          'content-type': 'application/json',
          'accept': 'application/json',
        };
        when(() => mockHttpClient.get(any(), headers: headers)).thenAnswer(
          (_) async => http.Response(fixture('random_user.json'), 200),
        );
        when(() => connectivity.checkConnectivity()).thenAnswer(
          (_) async => ConnectivityResult.mobile,
        );
        when(() => mockLocalDataSource.cacheRandomUser(any())).thenAnswer(
          (_) async => 1,
        );
      });
      test('Should check if device is online', () async {
        //arrange

        //act
        final result = await networkInfo.isConnected;

        //assert
        verify((() => connectivity.checkConnectivity()));
        expect(result, isTrue);
      });

      test('Should return a random user from remote data source', () async {
        //arrange

        //act
        final result = await repository.getRandomUser();

        //assert
        verify((() => mockHttpClient.get(Uri.parse(url), headers: headers)));
        verify((() => mockLocalDataSource.cacheRandomUser(any())));
        expect(result, isA<Right>());
      });

      test('Should return a list of users from remote data source', () async {
        //arrange
        const number = 3;
        final urlEndpoint = '$url/?results=$number';

        //act
        final result = await repository.getListOfRandomUsers(number);

        //assert
        verify((() =>
            mockHttpClient.get(Uri.parse(urlEndpoint), headers: headers)));
        verify((() => mockLocalDataSource.cacheRandomUser(any())));
        expect(result, isA<Right>());
      });
    });

    group('device is offline:', () {
      setUp(() async {
        when(() => connectivity.checkConnectivity()).thenAnswer(
          (_) async => ConnectivityResult.none,
        );
      });
      test('Should return device is offline (isConnected false)', () async {
        //arrange

        //act
        final result = await networkInfo.isConnected;

        //assert
        verify((() => connectivity.checkConnectivity()));
        expect(result, isFalse);
      });

      test('Should return a cached user', () async {
        //arrange
        when(() => mockLocalDataSource.getLastRandomUser())
            .thenAnswer((_) async => tRandomUserModel);

        //act
        final result = await repository.getRandomUser();

        //assert
        verify(() => mockLocalDataSource.getLastRandomUser());
        expect(result, isA<Right>());
      });

      test('Should return a list of cached users', () async {
        //arrange
        const number = 3;
        when(() => mockLocalDataSource.getAllCachedRandomUsers())
            .thenAnswer((_) async => [tRandomUserModel]);

        //act
        final result = await repository.getListOfRandomUsers(number);

        //assert
        verify(() => mockLocalDataSource.getAllCachedRandomUsers());
        expect(result, isA<Right>());
      });

      test('getLastRandomUser() Should return CacheException', () async {
        //arrange
        when(() => mockLocalDataSource.getLastRandomUser())
            .thenThrow(CacheException());

        //act
        final result = await repository.getRandomUser();

        //assert
        verify(() => mockLocalDataSource.getLastRandomUser());
        expect(result, isA<Left>());
      });

      test('getAllCachedRandomUsers() Should return CacheException', () async {
        //arrange
        when(() => mockLocalDataSource.getAllCachedRandomUsers())
            .thenThrow(CacheException());

        //act
        final result = await repository.getListOfRandomUsers(3);

        //assert
        verify(() => mockLocalDataSource.getAllCachedRandomUsers());
        expect(result, isA<Left>());
      });
    });
  });
}
