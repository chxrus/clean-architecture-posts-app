import 'package:clean_architecture_posts/core/constants/constants.dart';
import 'package:clean_architecture_posts/features/anime_posts/data/models/waifu.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'waifu_api_service.g.dart';

@RestApi(baseUrl: waifuAPIBaseURL)
abstract interface class WaifuApiService {
  factory WaifuApiService(Dio dio) = _WaifuApiService;

  @GET('/search')
  Future<HttpResponse<List<WaifuModel>>> getWaifus({
    @Query('limit') int? limit,
    @Query('is_nsfw') String? isNSFW,
  });
}
