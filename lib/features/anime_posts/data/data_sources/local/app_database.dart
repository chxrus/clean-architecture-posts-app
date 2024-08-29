import 'dart:async';

import 'package:clean_architecture_posts/features/anime_posts/data/data_sources/local/DAO/waifu_dao.dart';
import 'package:clean_architecture_posts/features/anime_posts/data/models/waifu.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';

@Database(version: 1, entities: [WaifuModel])
abstract class AppDatabase extends FloorDatabase {
  WaifuDao get waifuDao;
}
