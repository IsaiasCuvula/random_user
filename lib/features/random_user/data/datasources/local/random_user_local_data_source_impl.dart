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

  static Database? _database;

  set db(Database? value) {
    _database = value;
  }

  Future<Database> get database async {
    _database ??= await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, DbConstants.databaseName);
    return openDatabase(
      path,
      onCreate: _onCreate,
      version: DbConstants.databaseVersion,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    return await db.execute(DbConstants.createTableQuery);
  }

  @override
  Future<RandomUserModel> getLastRandomUser() async {
    final db = await database;

    try {
      final map = await db.query(
        DbConstants.tableName,
        limit: 1,
        orderBy: 'rowid DESC',
      );
      var serializedUser = map.first;
      final nameValue = serializedUser[DbConstants.columnName];
      final locationValue = serializedUser[DbConstants.columnLocation];
      final pictureValue = serializedUser[DbConstants.columnPicture];
      if (nameValue != null) {
        final decodedName = jsonDecode('$nameValue');
        serializedUser = {
          ...serializedUser,
          DbConstants.columnName: decodedName
        };
      }

      if (locationValue != null) {
        final decodedLocation = jsonDecode('$locationValue');
        serializedUser = {
          ...serializedUser,
          DbConstants.columnLocation: decodedLocation
        };
      }

      if (pictureValue != null) {
        final decodedPicture = jsonDecode('$pictureValue');
        serializedUser = {
          ...serializedUser,
          DbConstants.columnPicture: decodedPicture
        };
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
            DbConstants.tableName,
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
      final map = await db.query(DbConstants.tableName);
      final users = <RandomUserModel>[];

      for (var element in map) {
        var serializedUser = element;
        final nameValue = serializedUser[DbConstants.columnName];
        final locationValue = serializedUser[DbConstants.columnLocation];
        final pictureValue = serializedUser[DbConstants.columnPicture];
        if (nameValue != null) {
          final decodedName = jsonDecode('$nameValue');
          serializedUser = {
            ...serializedUser,
            DbConstants.columnName: decodedName
          };
        }
        if (locationValue != null) {
          final decodedLocation = jsonDecode('$locationValue');
          serializedUser = {
            ...serializedUser,
            DbConstants.columnLocation: decodedLocation
          };
        }
        if (pictureValue != null) {
          final decodedPicture = jsonDecode('$pictureValue');
          serializedUser = {
            ...serializedUser,
            DbConstants.columnPicture: decodedPicture
          };
        }
        users.add(UserMapper.mapToRandomUserModel(serializedUser));
      }
      return users;
    } catch (e) {
      throw CacheException();
    }
  }

  Future close() async => _database?.close();
}
