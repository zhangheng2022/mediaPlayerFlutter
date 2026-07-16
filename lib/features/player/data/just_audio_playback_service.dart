import 'package:audio_session/audio_session.dart';
import 'package:just_audio/just_audio.dart';

import '../domain/playback_service.dart';

class JustAudioPlaybackService implements PlaybackService {
  JustAudioPlaybackService({AudioPlayer? player})
    : _player = player ?? AudioPlayer();

  final AudioPlayer _player;
  bool _sessionConfigured = false;

  @override
  Stream<bool> get playingStream => _player.playingStream;

  @override
  Stream<PlaybackProcessingState> get processingStateStream =>
      _player.processingStateStream.map(_mapProcessingState).distinct();

  @override
  Stream<Duration> get positionStream => _player.positionStream;

  @override
  Stream<Duration?> get durationStream => _player.durationStream;

  @override
  Stream<int?> get currentIndexStream => _player.currentIndexStream;

  @override
  Future<void> setQueue(
    List<String> filePaths, {
    required int initialIndex,
  }) async {
    await _configureSession();
    await _player.setAudioSources(
      filePaths.map(AudioSource.file).toList(growable: false),
      initialIndex: initialIndex,
      initialPosition: Duration.zero,
    );
  }

  Future<void> _configureSession() async {
    if (_sessionConfigured) {
      return;
    }

    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.music());
    _sessionConfigured = true;
  }

  @override
  Future<void> play() => _player.play();

  @override
  Future<void> pause() => _player.pause();

  @override
  Future<void> seek(Duration position, {int? index}) =>
      _player.seek(position, index: index);

  @override
  Future<void> seekToNext() => _player.seekToNext();

  @override
  Future<void> seekToPrevious() => _player.seekToPrevious();

  @override
  Future<void> dispose() => _player.dispose();

  static PlaybackProcessingState _mapProcessingState(ProcessingState state) =>
      switch (state) {
        ProcessingState.idle => .idle,
        ProcessingState.loading => .loading,
        ProcessingState.buffering => .buffering,
        ProcessingState.ready => .ready,
        ProcessingState.completed => .completed,
      };
}
