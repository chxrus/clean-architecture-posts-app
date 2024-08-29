import 'package:clean_architecture_posts/core/resources/data_state.dart';
import 'package:clean_architecture_posts/features/anime_posts/domain/entities/waifu.dart';

abstract class WaifuRepository {
  // API methods
  Future<DataState<List<WaifuEntity>>> getWaifus();
  // Database methods
  Future<List<WaifuEntity>> getSavedWaifus();
  Future<void> saveWaifu(WaifuEntity waifu);
  Future<void> removeWaifu(WaifuEntity waifu);
}
