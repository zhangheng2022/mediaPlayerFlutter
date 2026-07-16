import 'dart:async';

import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';

import '../../../app/app_scope.dart';
import '../../../features/library/application/library_controller.dart';
import '../../../features/library/presentation/track_tile.dart';
import '../../../features/player/application/player_controller.dart';
import '../../../shared/widgets/empty_feature_state.dart';
import '../../../shared/widgets/feature_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dependencies = AppScope.of(context);
    final library = dependencies.library;
    final player = dependencies.player;

    return ListenableBuilder(
      listenable: Listenable.merge([library, player]),
      builder: (context, _) => FeaturePage(
        title: '你的音乐',
        actions: [
          FButton.icon(
            onPress: library.hasTracks ? () => context.go('/library') : null,
            variant: .ghost,
            semanticsLabel: library.hasTracks ? '打开曲库' : '曲库为空',
            child: const Icon(FLucideIcons.search),
          ),
        ],
        child: library.hasTracks
            ? _HomeLibrary(library: library, player: player)
            : EmptyFeatureState(
                icon: FLucideIcons.disc3,
                title: '让曲库响起来',
                description: '导入本地音乐后，这里会显示最近添加的歌曲。',
                actionLabel: '导入本地音乐',
                onAction: () => context.go('/library'),
              ),
      ),
    );
  }
}

class _HomeLibrary extends StatelessWidget {
  const _HomeLibrary({required this.library, required this.player});

  final LibraryController library;
  final PlayerController player;

  @override
  Widget build(BuildContext context) {
    final tracks = library.tracks.take(6).toList(growable: false);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 12, 12, 8),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  '最近添加 · ${library.tracks.length} 首',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              FButton(
                onPress: () => context.go('/library'),
                variant: .ghost,
                child: const Text('查看全部'),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 20),
            itemCount: tracks.length,
            itemBuilder: (context, index) {
              final track = tracks[index];
              final selected = player.currentTrack?.id == track.id;
              return TrackTile(
                track: track,
                selected: selected,
                playing: selected && player.isPlaying,
                onPress: () =>
                    unawaited(player.playTrack(track, queue: library.tracks)),
              );
            },
          ),
        ),
      ],
    );
  }
}
