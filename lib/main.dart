import 'package:clean_architecture_posts/config/theme/app_themes.dart';
import 'package:clean_architecture_posts/features/anime_posts/presentation/bloc/waifu/local/local_waifu_bloc.dart';
import 'package:clean_architecture_posts/features/anime_posts/presentation/bloc/waifu/remote/remote_waifu_bloc.dart';
import 'package:clean_architecture_posts/features/anime_posts/presentation/pages/home/waifu_posts.dart';
import 'package:clean_architecture_posts/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RemoteWaifuBloc>(
          create: (context) => sl()..add(const GetWaifusEvent()),
        ),
        BlocProvider<LocalWaifuBloc>(
          create: (context) => sl()..add(const GetSavedWaifusEvent()),
        ),
      ],
      child: MaterialApp(
        title: 'Waifus',
        theme: theme(),
        home: const WaifuPosts(),
      ),
    );
  }
}
