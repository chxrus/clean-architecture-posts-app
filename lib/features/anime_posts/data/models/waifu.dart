import 'dart:convert';

import 'package:clean_architecture_posts/features/anime_posts/domain/entities/waifu.dart';
import 'package:floor/floor.dart';

@Entity(tableName: 'waifu', primaryKeys: ['signature'])
class WaifuModel extends WaifuEntity {
  const WaifuModel({
    required super.signature,
    required super.width,
    required super.height,
    required super.byteSize,
    required super.url,
  });

  factory WaifuModel.fromJson(Map<String, dynamic> map) {
    return WaifuModel(
      signature: map['signature'] as String?,
      width: map['width'] as int?,
      height: map['height'] as int?,
      byteSize: map['byteSize'] as int?,
      url: map['url'] as String?,
    );
  }

  factory WaifuModel.fromEntity(WaifuEntity entity) {
    return WaifuModel(
      signature: entity.signature,
      width: entity.width,
      height: entity.height,
      byteSize: entity.byteSize,
      url: entity.url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'signature': signature,
      'width': width,
      'height': height,
      'byteSize': byteSize,
      'url': url,
    };
  }

  String toJson() => json.encode(toMap());
}
