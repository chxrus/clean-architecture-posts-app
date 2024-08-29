// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $AppDatabaseBuilderContract {
  /// Adds migrations to the builder.
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $AppDatabaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<AppDatabase> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder implements $AppDatabaseBuilderContract {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $AppDatabaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  WaifuDao? _waifuDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
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
            'CREATE TABLE IF NOT EXISTS `waifu` (`signature` TEXT, `width` INTEGER, `height` INTEGER, `byteSize` INTEGER, `url` TEXT, PRIMARY KEY (`signature`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  WaifuDao get waifuDao {
    return _waifuDaoInstance ??= _$WaifuDao(database, changeListener);
  }
}

class _$WaifuDao extends WaifuDao {
  _$WaifuDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _waifuModelInsertionAdapter = InsertionAdapter(
            database,
            'waifu',
            (WaifuModel item) => <String, Object?>{
                  'signature': item.signature,
                  'width': item.width,
                  'height': item.height,
                  'byteSize': item.byteSize,
                  'url': item.url
                }),
        _waifuModelDeletionAdapter = DeletionAdapter(
            database,
            'waifu',
            ['signature'],
            (WaifuModel item) => <String, Object?>{
                  'signature': item.signature,
                  'width': item.width,
                  'height': item.height,
                  'byteSize': item.byteSize,
                  'url': item.url
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<WaifuModel> _waifuModelInsertionAdapter;

  final DeletionAdapter<WaifuModel> _waifuModelDeletionAdapter;

  @override
  Future<List<WaifuModel>> getWaifus() async {
    return _queryAdapter.queryList('SELECT * FROM waifu',
        mapper: (Map<String, Object?> row) => WaifuModel(
            signature: row['signature'] as String?,
            width: row['width'] as int?,
            height: row['height'] as int?,
            byteSize: row['byteSize'] as int?,
            url: row['url'] as String?));
  }

  @override
  Future<void> insertWaifu(WaifuModel waifu) async {
    await _waifuModelInsertionAdapter.insert(waifu, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteWaifu(WaifuModel waifu) async {
    await _waifuModelDeletionAdapter.delete(waifu);
  }
}
