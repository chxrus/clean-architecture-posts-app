import 'package:clean_architecture_posts/features/anime_posts/presentation/bloc/waifu/local/local_waifus_bloc.dart';
import 'package:clean_architecture_posts/features/anime_posts/presentation/widgets/waifu_saved_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SavedWaifus extends StatelessWidget {
  const SavedWaifus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Saved Waifus',
        ),
      ),
      body: BlocBuilder<LocalWaifusBloc, LocalWaifusState>(
        builder: (_, state) {
          if (state is LocalWaifusDoneState) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return WaifuSavedTile(
                  waifu: state.waifus![index],
                );
              },
              itemCount: state.waifus!.length,
            );
          }

          if (state is LocalWaifusLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return const Center(
            child: Text('Unexpected error'),
          );
        },
      ),
    );
  }
}
