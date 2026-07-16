import 'dart:async';

import 'package:media_player_flutter/features/library/domain/audio_track.dart';
import 'package:media_player_flutter/features/library/domain/music_library_repository.dart';
import 'package:media_player_flutter/features/player/domain/playback_service.dart';

AudioTrack sampleTrack(
  String title, {
  String artist = '测试艺术家',
  String? filePath,
}) => AudioTrack(
  id: filePath ?? '/music/$artist - $title.mp3',
  path: filePath ?? '/music/$artist - $title.mp3',
  title: title,
  artist: artist,
  extension: 'MP3',
  sizeInBytes: 1024,
  modifiedAt: DateTime(2026),
);

class FakeMusicLibraryRepository implements MusicLibraryRepository {
  FakeMusicLibraryRepository({this.tracks = const [], this.cancelled = false});

  List<AudioTrack> tracks;
  bool cancelled;
  Exception? scanError;
  int importCount = 0;

  @override
  Future<List<AudioTrack>?> importTracks() async {
    importCount++;
    final error = scanError;
    if (error != null) {
      throw error;
    }
    if (cancelled) {
      return null;
    }
    return List.unmodifiable(tracks);
  }
}

class FakePlaybackService implements PlaybackService {
  final _playing = StreamController<bool>.broadcast(sync: true);
  final _processing = StreamController<PlaybackProcessingState>.broadcast(
    sync: true,
  );
  final _position = StreamController<Duration>.broadcast(sync: true);
  final _duration = StreamController<Duration?>.broadcast(sync: true);
  final _index = StreamController<int?>.broadcast(sync: true);

  List<String> queue = const [];
  int? currentIndex;
  int playCount = 0;
  int pauseCount = 0;
  int nextCount = 0;
  int previousCount = 0;
  Duration? lastSeek;

  @override
  Stream<bool> get playingStream => _playing.stream;

  @override
  Stream<PlaybackProcessingState> get processingStateStream =>
      _processing.stream;

  @override
  Stream<Duration> get positionStream => _position.stream;

  @override
  Stream<Duration?> get durationStream => _duration.stream;

  @override
  Stream<int?> get currentIndexStream => _index.stream;

  @override
  Future<void> setQueue(
    List<String> filePaths, {
    required int initialIndex,
  }) async {
    queue = List.unmodifiable(filePaths);
    currentIndex = initialIndex;
    _index.add(initialIndex);
    _processing.add(.ready);
    _duration.add(const Duration(minutes: 3));
  }

  @override
  Future<void> play() async {
    playCount++;
    _playing.add(true);
  }

  @override
  Future<void> pause() async {
    pauseCount++;
    _playing.add(false);
  }

  @override
  Future<void> seek(Duration position, {int? index}) async {
    lastSeek = position;
    if (index != null) {
      currentIndex = index;
      _index.add(index);
    }
    _position.add(position);
  }

  @override
  Future<void> seekToNext() async {
    nextCount++;
    final next = (currentIndex ?? 0) + 1;
    currentIndex = next;
    _index.add(next);
  }

  @override
  Future<void> seekToPrevious() async {
    previousCount++;
    final previous = (currentIndex ?? 1) - 1;
    currentIndex = previous;
    _index.add(previous);
  }

  void emitPosition(Duration value) => _position.add(value);

  @override
  Future<void> dispose() async {
    await Future.wait([
      _playing.close(),
      _processing.close(),
      _position.close(),
      _duration.close(),
      _index.close(),
    ]);
  }
}
