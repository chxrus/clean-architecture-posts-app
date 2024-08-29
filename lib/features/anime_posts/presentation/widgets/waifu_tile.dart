import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_architecture_posts/features/anime_posts/domain/entities/waifu.dart';
import 'package:clean_architecture_posts/features/anime_posts/presentation/bloc/waifu/local/local_waifus_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WaifuTile extends StatelessWidget {
  const WaifuTile({super.key, this.waifu});

  final WaifuEntity? waifu;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CachedNetworkImage(
      imageUrl: waifu!.url!,
      imageBuilder: (context, imageProvider) => Padding(
        padding: const EdgeInsets.all(12),
        child: Container(
          height: 500,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: theme.primaryColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: GestureDetector(
              onTap: () {
                context.read<LocalWaifusBloc>().add(SaveWaifusEvent(waifu!));
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      backgroundColor: theme.colorScheme.primary,
                      content: const Text('Waifu saved successfully.'),
                    ),
                  );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
      progressIndicatorBuilder: (context, url, progress) => Padding(
        padding: const EdgeInsets.all(12),
        child: Container(
          height: 500,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: theme.colorScheme.onSurface.withOpacity(.1),
          ),
          child: CupertinoActivityIndicator(
            radius: 18,
            color: theme.colorScheme.onSurface,
          ),
        ),
      ),
      errorWidget: (context, url, progress) => Padding(
        padding: const EdgeInsets.all(12),
        child: Container(
          height: 500,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: theme.colorScheme.onSurface.withOpacity(.1),
          ),
          child: const Text(
            'Something went wrong.',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
