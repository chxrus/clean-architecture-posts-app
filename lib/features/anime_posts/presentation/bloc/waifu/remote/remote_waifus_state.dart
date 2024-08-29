part of 'remote_waifus_bloc.dart';

abstract class RemoteWaifusState extends Equatable {
  final List<WaifuEntity>? waifus;
  final DioException? exception;

  const RemoteWaifusState({this.waifus, this.exception});

  @override
  List<Object?> get props => [waifus, exception];
}

class RemoteWaifusLoadingState extends RemoteWaifusState {
  const RemoteWaifusLoadingState();
}

class RemoteWaifusDoneState extends RemoteWaifusState {
  const RemoteWaifusDoneState(List<WaifuEntity> waifu) : super(waifus: waifu);
}

class RemoteWaifusExceptionState extends RemoteWaifusState {
  const RemoteWaifusExceptionState(DioException exception)
      : super(exception: exception);
}
