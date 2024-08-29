import 'package:clean_architecture_posts/core/usecases/usecase.dart';
import 'package:clean_architecture_posts/features/anime_posts/domain/entities/waifu.dart';
import 'package:clean_architecture_posts/features/anime_posts/domain/repository/waifu_repository.dart';

class SaveWaifuUseCase implements Usecase<void, WaifuEntity> {
  final WaifuRepository _waifuRepository;

  SaveWaifuUseCase(this._waifuRepository);

  @override
  Future<void> call({WaifuEntity? params}) {
    return _waifuRepository.saveWaifu(params!);
  }
}
