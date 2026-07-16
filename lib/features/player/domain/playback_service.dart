enum PlaybackProcessingState { idle, loading, buffering, ready, completed }

abstract interface class PlaybackService {
  Stream<bool> get playingStream;

  Stream<PlaybackProcessingState> get processingStateStream;

  Stream<Duration> get positionStream;

  Stream<Duration?> get durationStream;

  Stream<int?> get currentIndexStream;

  Future<void> setQueue(List<String> filePaths, {required int initialIndex});

  Future<void> play();

  Future<void> pause();

  Future<void> seek(Duration position, {int? index});

  Future<void> seekToNext();

  Future<void> seekToPrevious();

  Future<void> dispose();
}
