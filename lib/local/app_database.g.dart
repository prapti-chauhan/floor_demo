// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorUserDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$UserDatabaseBuilder databaseBuilder(String name) =>
      _$UserDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$UserDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$UserDatabaseBuilder(null);
}

class _$UserDatabaseBuilder {
  _$UserDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$UserDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$UserDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<UserDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$UserDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$UserDatabase extends UserDatabase {
  _$UserDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  MyDao? _myDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Users` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  MyDao get myDao {
    return _myDaoInstance ??= _$MyDao(database, changeListener);
  }
}

class _$MyDao extends MyDao {
  _$MyDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _usersInsertionAdapter = InsertionAdapter(
            database,
            'Users',
            (Users item) =>
                <String, Object?>{'id': item.id, 'name': item.name}),
        _usersUpdateAdapter = UpdateAdapter(
            database,
            'Users',
            ['id'],
            (Users item) =>
                <String, Object?>{'id': item.id, 'name': item.name}),
        _usersDeletionAdapter = DeletionAdapter(
            database,
            'Users',
            ['id'],
            (Users item) =>
                <String, Object?>{'id': item.id, 'name': item.name});

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Users> _usersInsertionAdapter;

  final UpdateAdapter<Users> _usersUpdateAdapter;

  final DeletionAdapter<Users> _usersDeletionAdapter;

  @override
  Future<Users?> retrieveUserById(int id) async {
    return _queryAdapter.query('SELECT * FROM Users WHERE id = ?1',
        mapper: (Map<String, Object?> row) =>
            Users(id: row['id'] as int?, name: row['name'] as String),
        arguments: [id]);
  }

  @override
  Future<List<Users>> retrieveUser() async {
    return _queryAdapter.queryList('SELECT * FROM Users',
        mapper: (Map<String, Object?> row) =>
            Users(id: row['id'] as int?, name: row['name'] as String));
  }

  @override
  Future<void> updateUsers(int id, String name) async {
    await _queryAdapter.queryNoReturn(
        'UPDATE Users SET name = ?2 WHERE id = ?1',
        arguments: [id, name]);
  }

  @override
  Future<void> insertUser(Users user) async {
    await _usersInsertionAdapter.insert(user, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateUser(Users user) async {
    await _usersUpdateAdapter.update(user, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteUser(Users user) async {
    await _usersDeletionAdapter.delete(user);
  }
}
