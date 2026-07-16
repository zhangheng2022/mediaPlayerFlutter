import 'dart:async';

import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

import '../../app/app_scope.dart';
import '../../features/player/application/player_controller.dart';

class MiniPlayer extends StatelessWidget {
  const MiniPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    final player = AppScope.of(context).player;

    return ListenableBuilder(
      listenable: player,
      builder: (context, _) => _MiniPlayerContent(player: player),
    );
  }
}

class _MiniPlayerContent extends StatelessWidget {
  const _MiniPlayerContent({required this.player});

  final PlayerController player;

  @override
  Widget build(BuildContext context) {
    final colors = context.theme.colors;
    final track = player.currentTrack;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colors.card,
        border: Border(top: BorderSide(color: colors.border)),
      ),
      child: SafeArea(
        top: false,
        bottom: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (track != null)
              FDeterminateProgress(
                value: player.progress,
                semanticsLabel: '歌曲播放进度',
              ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: colors.secondary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: SizedBox.square(
                      dimension: 48,
                      child: Icon(
                        player.isPlaying
                            ? FLucideIcons.audioLines
                            : FLucideIcons.music,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          track?.title ?? '尚未选择歌曲',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          player.errorMessage ??
                              track?.artist ??
                              '从曲库中选择一首音乐开始播放',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: colors.mutedForeground),
                        ),
                      ],
                    ),
                  ),
                  if (track != null) ...[
                    FButton.icon(
                      onPress: player.canGoPrevious
                          ? () => unawaited(player.previous())
                          : null,
                      variant: .ghost,
                      semanticsLabel: '上一首',
                      child: const Icon(FLucideIcons.skipBack),
                    ),
                    FButton.icon(
                      onPress: player.isLoading
                          ? null
                          : () => unawaited(player.togglePlayPause()),
                      semanticsLabel: player.isPlaying ? '暂停' : '播放',
                      child: player.isLoading
                          ? const FCircularProgress(size: .sm)
                          : Icon(
                              player.isPlaying
                                  ? FLucideIcons.pause
                                  : FLucideIcons.play,
                            ),
                    ),
                    FButton.icon(
                      onPress: player.canGoNext
                          ? () => unawaited(player.next())
                          : null,
                      variant: .ghost,
                      semanticsLabel: '下一首',
                      child: const Icon(FLucideIcons.skipForward),
                    ),
                  ] else
                    FButton.icon(
                      onPress: null,
                      semanticsLabel: '当前没有可播放歌曲',
                      child: const Icon(FLucideIcons.play),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
