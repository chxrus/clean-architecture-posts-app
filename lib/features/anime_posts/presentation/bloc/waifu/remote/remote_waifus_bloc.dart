import 'package:clean_architecture_posts/core/resources/data_state.dart';
import 'package:clean_architecture_posts/features/anime_posts/domain/entities/waifu.dart';
import 'package:clean_architecture_posts/features/anime_posts/domain/usecases/get_waifus.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'remote_waifus_event.dart';
part 'remote_waifus_state.dart';

class RemoteWaifusBloc extends Bloc<RemoteWaifusEvent, RemoteWaifusState> {
  final GetWaifusUseCase _getWaifuUseCase;

  RemoteWaifusBloc(this._getWaifuUseCase)
      : super(const RemoteWaifusLoadingState()) {
    on<GetWaifusEvent>(onGetWaifus);
  }

  void onGetWaifus(
      GetWaifusEvent event, Emitter<RemoteWaifusState> emit) async {
    final dataState = await _getWaifuUseCase();

    if (dataState is DataSuccess) {
      emit(RemoteWaifusDoneState(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(RemoteWaifusExceptionState(dataState.exception!));
    }
  }
}
