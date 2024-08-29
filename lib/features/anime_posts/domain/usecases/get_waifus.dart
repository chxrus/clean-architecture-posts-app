import 'package:clean_architecture_posts/core/resources/data_state.dart';
import 'package:clean_architecture_posts/core/usecases/usecase.dart';
import 'package:clean_architecture_posts/features/anime_posts/domain/entities/waifu.dart';
import 'package:clean_architecture_posts/features/anime_posts/domain/repository/waifu_repository.dart';

class GetWaifusUseCase implements Usecase<DataState<List<WaifuEntity>>, void> {
  final WaifuRepository _waifuRepository;

  GetWaifusUseCase(this._waifuRepository);

  @override
  Future<DataState<List<WaifuEntity>>> call({void params}) {
    return _waifuRepository.getWaifus();
  }
}
