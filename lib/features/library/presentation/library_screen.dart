import 'dart:async';

import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

import '../../../app/app_scope.dart';
import '../../player/application/player_controller.dart';
import '../../../shared/widgets/empty_feature_state.dart';
import '../../../shared/widgets/feature_page.dart';
import '../application/library_controller.dart';
import 'track_tile.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dependencies = AppScope.of(context);
    final library = dependencies.library;
    final player = dependencies.player;

    return ListenableBuilder(
      listenable: Listenable.merge([library, player]),
      builder: (context, _) => FeaturePage(
        title: '曲库',
        actions: library.hasTracks
            ? [
                FButton.icon(
                  onPress: library.isScanning
                      ? null
                      : () => unawaited(library.importMusic()),
                  variant: .ghost,
                  semanticsLabel: '继续导入本地音乐',
                  child: const Icon(FLucideIcons.plus),
                ),
              ]
            : const [],
        child: _LibraryContent(library: library, player: player),
      ),
    );
  }
}

class _LibraryContent extends StatelessWidget {
  const _LibraryContent({required this.library, required this.player});

  final LibraryController library;
  final PlayerController player;

  @override
  Widget build(BuildContext context) {
    if (library.isScanning && !library.hasTracks) {
      return const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FCircularProgress(semanticsLabel: '正在导入本地音乐'),
            SizedBox(height: 16),
            Text('正在导入本地音乐…'),
          ],
        ),
      );
    }

    if (library.status == .error && !library.hasTracks) {
      return EmptyFeatureState(
        icon: FLucideIcons.circleAlert,
        title: '没有读到选中的音频',
        description: library.errorMessage ?? '请重新选择可访问的音乐文件。',
        actionLabel: '重新选择音乐',
        onAction: () => unawaited(library.importMusic()),
      );
    }

    if (!library.hasTracks) {
      final scanned = library.status == .ready;
      return EmptyFeatureState(
        icon: FLucideIcons.library,
        title: scanned ? '没有导入支持的音频' : '还没有本地音乐',
        description: scanned
            ? '目前支持 MP3、FLAC、M4A、AAC、OGG、OPUS 和 WAV。'
            : '从系统文件选择器批量导入歌曲后，可以在这里浏览并直接播放。',
        actionLabel: scanned ? '重新选择音乐' : '导入本地音乐',
        onAction: () => unawaited(library.importMusic()),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (library.isScanning) const FProgress(semanticsLabel: '正在导入音乐'),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 8),
          child: Text(
            '${library.tracks.length} 首歌曲',
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 20),
            itemCount: library.tracks.length,
            itemBuilder: (context, index) {
              final track = library.tracks[index];
              final selected = player.currentTrack?.id == track.id;
              return TrackTile(
                key: ValueKey(track.id),
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
