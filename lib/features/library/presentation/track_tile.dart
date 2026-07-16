import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

import '../domain/audio_track.dart';

class TrackTile extends StatelessWidget {
  const TrackTile({
    required this.track,
    required this.onPress,
    this.selected = false,
    this.playing = false,
    super.key,
  });

  final AudioTrack track;
  final VoidCallback onPress;
  final bool selected;
  final bool playing;

  @override
  Widget build(BuildContext context) {
    final colors = context.theme.colors;

    return FTile(
      selected: selected,
      semanticsLabel: '${track.title}，${track.artist}',
      onPress: onPress,
      prefix: DecoratedBox(
        decoration: BoxDecoration(
          color: selected ? colors.primary : colors.secondary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: SizedBox.square(
          dimension: 44,
          child: Icon(
            playing ? FLucideIcons.audioLines : FLucideIcons.music2,
            color: selected ? colors.primaryForeground : null,
          ),
        ),
      ),
      title: Text(track.title),
      subtitle: Text(track.artist),
      details: Text(track.extension),
      suffix: Icon(
        selected && playing ? FLucideIcons.pause : FLucideIcons.play,
        size: 18,
      ),
    );
  }
}
