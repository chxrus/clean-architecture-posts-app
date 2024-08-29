part of 'local_waifus_bloc.dart';

abstract class LocalWaifusEvent extends Equatable {
  final WaifuEntity? waifu;

  const LocalWaifusEvent({this.waifu});

  @override
  List<Object> get props => [waifu!];
}

class GetSavedWaifusEvent extends LocalWaifusEvent {
  const GetSavedWaifusEvent();
}

class SaveWaifusEvent extends LocalWaifusEvent {
  const SaveWaifusEvent(WaifuEntity waifu) : super(waifu: waifu);
}

class RemoveWaifusEvent extends LocalWaifusEvent {
  const RemoveWaifusEvent(WaifuEntity waifu) : super(waifu: waifu);
}
