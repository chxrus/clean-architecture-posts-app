import 'package:clean_architecture_posts/features/anime_posts/data/data_sources/local/app_database.dart';
import 'package:clean_architecture_posts/features/anime_posts/data/data_sources/remote/waifu_api_service.dart';
import 'package:clean_architecture_posts/features/anime_posts/data/repository/waifu_repository_impl.dart';
import 'package:clean_architecture_posts/features/anime_posts/domain/repository/waifu_repository.dart';
import 'package:clean_architecture_posts/features/anime_posts/domain/usecases/get_saved_waifu.dart';
import 'package:clean_architecture_posts/features/anime_posts/domain/usecases/get_waifu.dart';
import 'package:clean_architecture_posts/features/anime_posts/domain/usecases/remove_waifu.dart';
import 'package:clean_architecture_posts/features/anime_posts/domain/usecases/save_waifu.dart';
import 'package:clean_architecture_posts/features/anime_posts/presentation/bloc/waifu/local/local_waifu_bloc.dart';
import 'package:clean_architecture_posts/features/anime_posts/presentation/bloc/waifu/remote/remote_waifu_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  sl.registerSingleton<AppDatabase>(database);

  // Dio
  sl.registerSingleton<Dio>(Dio());

  // Dependencies
  sl.registerSingleton<WaifuApiService>(WaifuApiService(sl()));
  sl.registerSingleton<WaifuRepository>(WaifuRepositoryImpl(sl(), sl()));

  // UseCases
  sl.registerSingleton<GetWaifuUseCase>(GetWaifuUseCase(sl()));
  sl.registerSingleton<GetSavedWaifuUseCase>(GetSavedWaifuUseCase(sl()));
  sl.registerSingleton<SaveWaifuUseCase>(SaveWaifuUseCase(sl()));
  sl.registerSingleton<RemoveWaifuUseCase>(RemoveWaifuUseCase(sl()));

  // Blocs
  sl.registerFactory<RemoteWaifuBloc>(() => RemoteWaifuBloc(sl()));
  sl.registerFactory<LocalWaifuBloc>(() => LocalWaifuBloc(sl(), sl(), sl()));
}
