import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:media_player_flutter/features/library/application/library_controller.dart';

import '../../../support/fakes.dart';

void main() {
  group('LibraryController', () {
    test('选择音频后导入并发布只读曲库', () async {
      final tracks = [sampleTrack('第一首'), sampleTrack('第二首')];
      final repository = FakeMusicLibraryRepository(tracks: tracks);
      final controller = LibraryController(repository);
      addTearDown(controller.dispose);

      await controller.importMusic();

      expect(controller.status, LibraryStatus.ready);
      expect(controller.tracks, tracks);
      expect(repository.importCount, 1);
      expect(
        () => controller.tracks.add(sampleTrack('第三首')),
        throwsUnsupportedError,
      );
    });

    test('取消音频选择时保持空闲', () async {
      final controller = LibraryController(
        FakeMusicLibraryRepository(cancelled: true),
      );
      addTearDown(controller.dispose);

      await controller.importMusic();

      expect(controller.status, LibraryStatus.idle);
      expect(controller.tracks, isEmpty);
    });

    test('音频不可访问时暴露可操作错误', () async {
      final repository = FakeMusicLibraryRepository()
        ..scanError = const FileSystemException('denied');
      final controller = LibraryController(repository);
      addTearDown(controller.dispose);

      await controller.importMusic();

      expect(controller.status, LibraryStatus.error);
      expect(controller.errorMessage, contains('无法读取'));
    });
  });
}
