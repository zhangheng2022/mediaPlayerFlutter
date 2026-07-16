import '../domain/audio_track.dart';
import '../domain/music_library_repository.dart';
import 'local_music_scanner.dart';
import 'music_file_picker_service.dart';

class LocalMusicLibraryRepository implements MusicLibraryRepository {
  const LocalMusicLibraryRepository(this._filePicker, this._scanner);

  final MusicFilePickerService _filePicker;
  final MusicScanner _scanner;

  @override
  Future<List<AudioTrack>?> importTracks() async {
    final paths = await _filePicker.chooseAudioFiles();
    if (paths == null) {
      return null;
    }
    final files = await _scanner.scanPaths(paths);
    return List.unmodifiable(
      files.map(
        (file) => AudioTrack.fromFile(
          filePath: file.path,
          sizeInBytes: file.sizeInBytes,
          modifiedAt: file.modifiedAt,
        ),
      ),
    );
  }
}
