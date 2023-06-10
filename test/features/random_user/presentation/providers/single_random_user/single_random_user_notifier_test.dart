import 'package:flutter_test/flutter_test.dart';
import 'package:random_user/features/random_user/random_user.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:mocktail/mocktail.dart';
import 'package:random_user/core/core.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:state_notifier_test/state_notifier_test.dart';
import '../../../../../fixtures/fixture_reader.dart';

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
  late RandomUser tRandomUser;
  late Map<String, String> headers;
  late String url;
  late Database database;
  late SingleRandomUserNotifier singleRandomUserNotifier;
  late GetRandomUser getRandomUser;

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
    headers = {
      'content-type': 'application/json',
      'accept': 'application/json',
    };
    url = ApiUrls.randomUserBaseUrl;
    registerFallbackValue(Uri.parse(url));
    final userModel = UserMapper.fromJson(
      json.decode(fixture('random_user.json')),
    );
    registerFallbackValue(userModel);
    tRandomUser = UserMapper.toEntity(userModel);
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

    //
    when(() => connectivity.checkConnectivity()).thenAnswer(
      (_) async => ConnectivityResult.mobile,
    );
    getRandomUser = GetRandomUser(repository);
    singleRandomUserNotifier = SingleRandomUserNotifier(getRandomUser);
  });

  stateNotifierTest<SingleRandomUserNotifier, SingleRandomUserState>(
    'Should fetch a random user',
    build: () => singleRandomUserNotifier,
    setUp: () {
      when(() => connectivity.checkConnectivity()).thenAnswer(
        (_) async => ConnectivityResult.mobile,
      );
      when(() => mockHttpClient.get(any(), headers: headers)).thenAnswer(
        (_) async => http.Response(fixture('random_user.json'), 200),
      );

      when(() => mockLocalDataSource.cacheRandomUser(any())).thenAnswer(
        (_) async => 1,
      );
    },
    actions: (notifier) async {
      await notifier.getRandomUser();
    },
    expect: () => [
      isA<SingleRandomUserState>(),
      isA<SingleRandomUserState>(),
    ],
  );
}
