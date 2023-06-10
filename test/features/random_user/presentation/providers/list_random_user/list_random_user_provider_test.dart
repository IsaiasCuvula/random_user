import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_user/features/random_user/random_user.dart';
import 'package:random_user/core/core.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late ProviderContainer providerContainer;
  late Database database;

  setUpAll(() async {
    providerContainer = ProviderContainer();
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
    database = await databaseFactoryFfi.openDatabase(
      inMemoryDatabasePath,
      options: OpenDatabaseOptions(
        version: DbConstants.databaseVersion,
      ),
    );
    await database.execute(DbConstants.createTableQuery);
  });

  tearDown(() {
    providerContainer.dispose();
  });

  test(
      'listRandomUserProvider should returns an instance of ListRandomUsersState...',
      () {
    //arrange

    //act
    final result = providerContainer.read(listRandomUserProvider);

    //assert
    expect(result, isA<ListRandomUsersState>());
  });
}
