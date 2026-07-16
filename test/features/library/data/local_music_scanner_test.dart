import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:media_player_flutter/features/library/data/local_music_scanner.dart';
import 'package:media_player_flutter/features/library/domain/audio_track.dart';
import 'package:path/path.dart' as path;

void main() {
  group('LocalMusicScanner', () {
    late Directory directory;

    setUp(() async {
      directory = await Directory.systemTemp.createTemp('music_scanner_test');
    });

    tearDown(() async {
      if (await directory.exists()) {
        await directory.delete(recursive: true);
      }
    });

    test('扫描支持的音频并忽略其他文件', () async {
      final album = await Directory(
        path.join(directory.path, 'album'),
      ).create();
      final sunny = path.join(directory.path, '周杰伦 - 晴天.mp3');
      final nocturne = path.join(album.path, '夜曲.FLAC');
      await File(sunny).writeAsBytes([1, 2]);
      await File(nocturne).writeAsBytes([1]);
      await File(path.join(album.path, 'cover.jpg')).writeAsBytes([1]);

      final result = await const LocalMusicScanner().scanPaths([
        sunny,
        nocturne,
        path.join(album.path, 'cover.jpg'),
      ]);

      expect(result, hasLength(2));
      expect(result.map((file) => file.path), containsAll([sunny, nocturne]));
    });

    test('不存在的文件会被安全忽略', () async {
      final result = await const LocalMusicScanner().scanPaths([
        path.join(directory.path, 'missing.mp3'),
      ]);

      expect(result, isEmpty);
    });
  });

  group('AudioTrack', () {
    test('从文件名解析艺术家与歌名', () {
      final track = AudioTrack.fromFile(
        filePath: '/music/孙燕姿 - 遇见.mp3',
        sizeInBytes: 10,
        modifiedAt: DateTime(2026),
      );

      expect(track.artist, '孙燕姿');
      expect(track.title, '遇见');
      expect(track.extension, 'MP3');
    });
  });
}
