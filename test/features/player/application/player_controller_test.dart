import 'package:flutter_test/flutter_test.dart';
import 'package:media_player_flutter/features/player/application/player_controller.dart';

import '../../../support/fakes.dart';

void main() {
  group('PlayerController', () {
    test('点击歌曲后建立队列并开始播放', () async {
      final service = FakePlaybackService();
      final controller = PlayerController(service);
      addTearDown(controller.dispose);
      final tracks = [sampleTrack('第一首'), sampleTrack('第二首')];

      await controller.playTrack(tracks[1], queue: tracks);

      expect(service.queue, tracks.map((track) => track.path));
      expect(controller.currentTrack, tracks[1]);
      expect(controller.isPlaying, isTrue);
      expect(service.playCount, 1);
    });

    test('播放按钮可以暂停和恢复', () async {
      final service = FakePlaybackService();
      final controller = PlayerController(service);
      addTearDown(controller.dispose);
      final track = sampleTrack('第一首');
      await controller.playTrack(track, queue: [track]);

      await controller.togglePlayPause();
      expect(controller.isPlaying, isFalse);
      expect(service.pauseCount, 1);

      await controller.togglePlayPause();
      expect(controller.isPlaying, isTrue);
      expect(service.playCount, 2);
    });
  });
}
