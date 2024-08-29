import 'package:equatable/equatable.dart';

class WaifuEntity extends Equatable {
  final String? signature;
  final int? width;
  final int? height;
  final int? byteSize;
  final String? url;

  const WaifuEntity({
    required this.signature,
    required this.width,
    required this.height,
    required this.byteSize,
    required this.url,
  });

  @override
  List<Object?> get props => [
        signature,
        width,
        height,
        byteSize,
        url,
      ];
}
