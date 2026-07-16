import 'package:path/path.dart' as p;

class AudioTrack {
  const AudioTrack({
    required this.id,
    required this.path,
    required this.title,
    required this.artist,
    required this.extension,
    required this.sizeInBytes,
    required this.modifiedAt,
  });

  factory AudioTrack.fromFile({
    required String filePath,
    required int sizeInBytes,
    required DateTime modifiedAt,
  }) {
    final fileName = p.basenameWithoutExtension(filePath).trim();
    final separator = fileName.indexOf(' - ');
    final parsedArtist = separator > 0
        ? fileName.substring(0, separator).trim()
        : '未知艺术家';
    final parsedTitle = separator > 0
        ? fileName.substring(separator + 3).trim()
        : fileName;

    return AudioTrack(
      id: filePath,
      path: filePath,
      title: parsedTitle.isEmpty ? '未命名歌曲' : parsedTitle,
      artist: parsedArtist.isEmpty ? '未知艺术家' : parsedArtist,
      extension: p.extension(filePath).replaceFirst('.', '').toUpperCase(),
      sizeInBytes: sizeInBytes,
      modifiedAt: modifiedAt,
    );
  }

  final String id;
  final String path;
  final String title;
  final String artist;
  final String extension;
  final int sizeInBytes;
  final DateTime modifiedAt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is AudioTrack && other.id == id;

  @override
  int get hashCode => id.hashCode;
}
