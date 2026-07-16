import 'dart:io';

import 'package:path/path.dart' as path;

class ScannedAudioFile {
  const ScannedAudioFile({
    required this.path,
    required this.sizeInBytes,
    required this.modifiedAt,
  });

  final String path;
  final int sizeInBytes;
  final DateTime modifiedAt;
}

abstract interface class MusicScanner {
  Future<List<ScannedAudioFile>> scanPaths(Iterable<String> filePaths);
}

class LocalMusicScanner implements MusicScanner {
  const LocalMusicScanner();

  static const supportedExtensions = {
    '.aac',
    '.flac',
    '.m4a',
    '.mp3',
    '.ogg',
    '.opus',
    '.wav',
  };

  @override
  Future<List<ScannedAudioFile>> scanPaths(Iterable<String> filePaths) async {
    final files = <ScannedAudioFile>[];
    for (final filePath in filePaths) {
      if (!_isSupported(filePath)) {
        continue;
      }

      final file = File(filePath);
      if (!await file.exists()) {
        continue;
      }
      final stat = await file.stat();
      files.add(
        ScannedAudioFile(
          path: filePath,
          sizeInBytes: stat.size,
          modifiedAt: stat.modified,
        ),
      );
    }

    files.sort((left, right) {
      final byName = path
          .basename(left.path)
          .toLowerCase()
          .compareTo(path.basename(right.path).toLowerCase());
      return byName != 0 ? byName : left.path.compareTo(right.path);
    });
    return List.unmodifiable(files);
  }

  bool _isSupported(String filePath) =>
      supportedExtensions.contains(path.extension(filePath).toLowerCase());
}
