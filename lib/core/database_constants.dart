class DbConstants {
  //db
  static const databaseName = 'random_user.db';
  static const tableName = 'cached_random_user';
  static const databaseVersion = 1;
  //column
  static const columnGender = 'gender';
  static const columnName = 'name';
  static const columnLocation = 'location';
  static const columnEmail = 'email';
  static const columnPhone = 'phone';
  static const columnPicture = 'picture';
  static const columnNat = 'nat';

  static const String createTableQuery = '''
    CREATE TABLE $tableName (
      $columnGender TEXT,
      $columnName TEXT,
      $columnLocation TEXT,
      $columnEmail TEXT,
      $columnPhone TEXT,
      $columnPicture TEXT,
      $columnNat TEXT
    )
  ''';
}
