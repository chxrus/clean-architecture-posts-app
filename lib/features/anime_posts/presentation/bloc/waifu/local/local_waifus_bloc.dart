import 'package:bloc/bloc.dart';
import 'package:clean_architecture_posts/features/anime_posts/domain/entities/waifu.dart';
import 'package:clean_architecture_posts/features/anime_posts/domain/usecases/get_saved_waifus.dart';
import 'package:clean_architecture_posts/features/anime_posts/domain/usecases/remove_waifu.dart';
import 'package:clean_architecture_posts/features/anime_posts/domain/usecases/save_waifu.dart';
import 'package:equatable/equatable.dart';

part 'local_waifus_event.dart';
part 'local_waifus_state.dart';

class LocalWaifusBloc extends Bloc<LocalWaifusEvent, LocalWaifusState> {
  final GetSavedWaifusUseCase _getSavedWaifusUseCase;
  final SaveWaifuUseCase _saveWaifuUseCase;
  final RemoveWaifuUseCase _removeWaifuUseCase;

  LocalWaifusBloc(
    this._getSavedWaifusUseCase,
    this._saveWaifuUseCase,
    this._removeWaifuUseCase,
  ) : super(const LocalWaifusLoadingState()) {
    on<GetSavedWaifusEvent>(onGetSavedWaifus);
    on<SaveWaifusEvent>(onSaveWaifu);
    on<RemoveWaifusEvent>(onRemoveWaifu);
  }

  Future<void> onGetSavedWaifus(
      GetSavedWaifusEvent event, Emitter<LocalWaifusState> emit) async {
    final waifus = await _getSavedWaifusUseCase();
    emit(LocalWaifusDoneState(waifus));
  }

  Future<void> onSaveWaifu(
      SaveWaifusEvent event, Emitter<LocalWaifusState> emit) async {
    await _saveWaifuUseCase(params: event.waifu);
    final waifus = await _getSavedWaifusUseCase();
    emit(LocalWaifusDoneState(waifus));
  }

  Future<void> onRemoveWaifu(
      RemoveWaifusEvent event, Emitter<LocalWaifusState> emit) async {
    await _removeWaifuUseCase(params: event.waifu);
    final waifus = await _getSavedWaifusUseCase();
    emit(LocalWaifusDoneState(waifus));
  }
}
