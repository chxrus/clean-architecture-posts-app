import 'package:clean_architecture_posts/core/usecases/usecase.dart';
import 'package:clean_architecture_posts/features/anime_posts/domain/entities/waifu.dart';
import 'package:clean_architecture_posts/features/anime_posts/domain/repository/waifu_repository.dart';

class GetSavedWaifusUseCase implements Usecase<List<WaifuEntity>, void> {
  final WaifuRepository _waifuRepository;

  GetSavedWaifusUseCase(this._waifuRepository);

  @override
  Future<List<WaifuEntity>> call({void params}) {
    return _waifuRepository.getSavedWaifus();
  }
}
