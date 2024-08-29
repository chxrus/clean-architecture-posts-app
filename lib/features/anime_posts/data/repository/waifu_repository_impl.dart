import 'dart:io';

import 'package:clean_architecture_posts/core/constants/constants.dart';
import 'package:clean_architecture_posts/core/resources/data_state.dart';
import 'package:clean_architecture_posts/features/anime_posts/data/data_sources/local/app_database.dart';
import 'package:clean_architecture_posts/features/anime_posts/data/data_sources/remote/waifu_api_service.dart';
import 'package:clean_architecture_posts/features/anime_posts/data/models/waifu.dart';
import 'package:clean_architecture_posts/features/anime_posts/domain/entities/waifu.dart';
import 'package:clean_architecture_posts/features/anime_posts/domain/repository/waifu_repository.dart';
import 'package:dio/dio.dart';

class WaifuRepositoryImpl implements WaifuRepository {
  final WaifuApiService _waifuApiService;
  final AppDatabase _appDatabase;

  const WaifuRepositoryImpl(this._waifuApiService, this._appDatabase);

  @override
  Future<DataState<List<WaifuModel>>> getWaifus() async {
    try {
      final httpResponse = await _waifuApiService.getWaifus(
        limit: limitQuery,
        isNSFW: isNSFWQuery,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(
          DioException(
            error: httpResponse.response.statusMessage,
            requestOptions: httpResponse.response.requestOptions,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
          ),
        );
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<List<WaifuEntity>> getSavedWaifus() {
    return _appDatabase.waifuDao.getWaifus();
  }

  @override
  Future<void> removeWaifu(WaifuEntity waifu) {
    return _appDatabase.waifuDao.deleteWaifu(WaifuModel.fromEntity(waifu));
  }

  @override
  Future<void> saveWaifu(WaifuEntity waifu) {
    return _appDatabase.waifuDao.insertWaifu(WaifuModel.fromEntity(waifu));
  }
}
