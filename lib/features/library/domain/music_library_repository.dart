import 'audio_track.dart';

abstract interface class MusicLibraryRepository {
  Future<List<AudioTrack>?> importTracks();
}
