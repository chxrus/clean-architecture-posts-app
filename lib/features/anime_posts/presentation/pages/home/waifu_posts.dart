import 'package:clean_architecture_posts/features/anime_posts/presentation/bloc/waifu/remote/remote_waifus_bloc.dart';
import 'package:clean_architecture_posts/features/anime_posts/presentation/pages/saved_waifus/saved_waifus.dart';
import 'package:clean_architecture_posts/features/anime_posts/presentation/widgets/waifu_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WaifuPosts extends StatelessWidget {
  const WaifuPosts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Waifus',
        ),
        leading: IconButton(
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => const SavedWaifus(),
            ),
          ),
          icon: const Icon(
            Icons.turned_in_rounded,
            size: 24,
          ),
        ),
      ),
      body: BlocBuilder<RemoteWaifusBloc, RemoteWaifusState>(
        builder: (_, state) {
          return RefreshIndicator(
            onRefresh: () async {
              BlocProvider.of<RemoteWaifusBloc>(context)
                  .add(const GetWaifusEvent());
            },
            child: CustomScrollView(
              slivers: [
                if (state is RemoteWaifusDoneState)
                  SliverList.builder(
                    itemBuilder: (context, index) {
                      return WaifuTile(
                        waifu: state.waifus![index],
                      );
                    },
                    itemCount: state.waifus!.length,
                  ),
                if (state is RemoteWaifusLoadingState)
                  const SliverFillRemaining(
                      child: Center(child: CircularProgressIndicator())),
                if (state is RemoteWaifusExceptionState)
                  const SliverToBoxAdapter(
                      child: Center(child: Text('Unexpected error'))),
              ],
            ),
          );
        },
      ),
    );
  }
}
