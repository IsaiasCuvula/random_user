import 'dart:convert';
import 'package:path/path.dart';
import 'package:random_user/core/core.dart';
import 'package:random_user/features/random_user/random_user.dart';
import 'package:sqflite/sqflite.dart';

class RandomUserLocalDataSourceImpl implements RandomUserLocalDataSource {
  static final RandomUserLocalDataSourceImpl _instance =
      RandomUserLocalDataSourceImpl._();

  factory RandomUserLocalDataSourceImpl() => _instance;

  RandomUserLocalDataSourceImpl._() {
    _initDatabase();
  }

  static const _databaseName = 'random_user.db1';
  static const _tableName = 'cached_random_user';
  static const _databaseVersion = 1;
  //column
  static const _columnGender = 'gender';
  static const _columnName = 'name';
  static const _columnLocation = 'location';
  static const _columnEmail = 'email';
  static const _columnPhone = 'phone';
  static const _columnPicture = 'picture';
  static const _columnNat = 'nat';

  static Database? _database;

  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  @override
  Future<RandomUserModel> getLastRandomUser() async {
    final db = await database;

    try {
      final map = await db.query(
        _tableName,
        limit: 1,
        orderBy: 'rowid DESC',
      );
      var serializedUser = map.first;
      final nameValue = serializedUser[_columnName];
      final locationValue = serializedUser[_columnLocation];
      final pictureValue = serializedUser[_columnPicture];
      if (nameValue != null) {
        final decodedName = jsonDecode('$nameValue');
        serializedUser = {...serializedUser, _columnName: decodedName};
      }

      if (locationValue != null) {
        final decodedLocation = jsonDecode('$locationValue');
        serializedUser = {...serializedUser, _columnLocation: decodedLocation};
      }

      if (pictureValue != null) {
        final decodedPicture = jsonDecode('$pictureValue');
        serializedUser = {...serializedUser, _columnPicture: decodedPicture};
      }

      return UserMapper.mapToRandomUserModel(serializedUser);
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<int> cacheRandomUser(RandomUserModel userToCache) async {
    final db = await database;
    try {
      final serializedUser = UserMapper.toJson(userToCache);
      return db.transaction(
        (txn) async {
          return await txn.insert(
            _tableName,
            serializedUser,
            conflictAlgorithm: ConflictAlgorithm.replace,
          );
        },
      );
    } catch (e) {
      throw CacheException();
    }
  }

  @override
  Future<ListUsersModel> getAllCachedRandomUsers() async {
    final db = await database;
    try {
      final map = await db.query(_tableName);
      final users = <RandomUserModel>[];

      for (var element in map) {
        var serializedUser = element;
        final nameValue = serializedUser[_columnName];
        final locationValue = serializedUser[_columnLocation];
        final pictureValue = serializedUser[_columnPicture];
        if (nameValue != null) {
          final decodedName = jsonDecode('$nameValue');
          serializedUser = {...serializedUser, _columnName: decodedName};
        }
        if (locationValue != null) {
          final decodedLocation = jsonDecode('$locationValue');
          serializedUser = {
            ...serializedUser,
            _columnLocation: decodedLocation
          };
        }
        if (pictureValue != null) {
          final decodedPicture = jsonDecode('$pictureValue');
          serializedUser = {...serializedUser, _columnPicture: decodedPicture};
        }
        users.add(UserMapper.mapToRandomUserModel(serializedUser));
      }
      return users;
    } catch (e) {
      throw CacheException();
    }
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, _databaseName);
    return openDatabase(
      path,
      onCreate: _onCreate,
      version: _databaseVersion,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    return await db.execute(''' 
          CREATE TABLE $_tableName (
          $_columnGender TEXT,
          $_columnName TEXT,
          $_columnLocation TEXT,
          $_columnEmail TEXT,
          $_columnPhone TEXT,
          $_columnPicture TEXT,
          $_columnNat TEXT
        )
        ''');
  }

  Future close() async => _database?.close();
}
