import '../features/library/application/library_controller.dart';
import '../features/library/data/local_music_library_repository.dart';
import '../features/library/data/local_music_scanner.dart';
import '../features/library/data/music_file_picker_service.dart';
import '../features/player/application/player_controller.dart';
import '../features/player/data/just_audio_playback_service.dart';

class AppDependencies {
  const AppDependencies({required this.library, required this.player});

  factory AppDependencies.production() => AppDependencies(
    library: LibraryController(
      const LocalMusicLibraryRepository(
        FilePickerMusicFilePickerService(),
        LocalMusicScanner(),
      ),
    ),
    player: PlayerController(JustAudioPlaybackService()),
  );

  final LibraryController library;
  final PlayerController player;

  void dispose() {
    library.dispose();
    player.dispose();
  }
}
