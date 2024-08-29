import 'package:clean_architecture_posts/features/anime_posts/data/models/waifu.dart';
import 'package:floor/floor.dart';

@dao
abstract class WaifuDao {
  @insert
  Future<void> insertWaifu(WaifuModel waifu);

  @delete
  Future<void> deleteWaifu(WaifuModel waifu);

  @Query('SELECT * FROM waifu')
  Future<List<WaifuModel>> getWaifus();
}
