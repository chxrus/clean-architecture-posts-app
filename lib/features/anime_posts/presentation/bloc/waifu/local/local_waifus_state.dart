part of 'local_waifus_bloc.dart';

abstract class LocalWaifusState extends Equatable {
  final List<WaifuEntity>? waifus;

  const LocalWaifusState({this.waifus});

  @override
  List<Object> get props => [waifus!];
}

class LocalWaifusLoadingState extends LocalWaifusState {
  const LocalWaifusLoadingState();
}

class LocalWaifusDoneState extends LocalWaifusState {
  const LocalWaifusDoneState(List<WaifuEntity> waifus) : super(waifus: waifus);
}
