import 'dart:async';

import 'package:flutter/foundation.dart';

import '../../library/domain/audio_track.dart';
import '../domain/playback_service.dart';

class PlayerController extends ChangeNotifier {
  PlayerController(this._playbackService) {
    _subscriptions.addAll([
      _playbackService.playingStream.listen(_onPlayingChanged),
      _playbackService.processingStateStream.listen(_onProcessingChanged),
      _playbackService.positionStream.listen(_onPositionChanged),
      _playbackService.durationStream.listen(_onDurationChanged),
      _playbackService.currentIndexStream.listen(_onCurrentIndexChanged),
    ]);
  }

  final PlaybackService _playbackService;
  final List<StreamSubscription<dynamic>> _subscriptions = [];

  List<AudioTrack> _queue = const [];
  int? _currentIndex;
  bool _isPlaying = false;
  PlaybackProcessingState _processingState = .idle;
  Duration _position = Duration.zero;
  Duration? _duration;
  String? _errorMessage;
  bool _disposed = false;

  List<AudioTrack> get queue => _queue;
  int? get currentIndex => _currentIndex;
  bool get isPlaying =>
      _isPlaying && _processingState != .completed && hasCurrentTrack;
  bool get isLoading =>
      _processingState == .loading || _processingState == .buffering;
  PlaybackProcessingState get processingState => _processingState;
  Duration get position => _position;
  Duration? get duration => _duration;
  String? get errorMessage => _errorMessage;
  bool get hasCurrentTrack => currentTrack != null;
  bool get canGoPrevious => (_currentIndex ?? 0) > 0 || _position.inSeconds > 3;
  bool get canGoNext =>
      _currentIndex != null && _currentIndex! < _queue.length - 1;

  AudioTrack? get currentTrack {
    final index = _currentIndex;
    if (index == null || index < 0 || index >= _queue.length) {
      return null;
    }
    return _queue[index];
  }

  double get progress {
    final total = _duration?.inMilliseconds ?? 0;
    if (total <= 0) {
      return 0;
    }
    return (_position.inMilliseconds / total).clamp(0, 1);
  }

  Future<void> playTrack(
    AudioTrack track, {
    required List<AudioTrack> queue,
  }) async {
    final initialIndex = queue.indexWhere(
      (candidate) => candidate.id == track.id,
    );
    if (initialIndex < 0) {
      return;
    }

    _queue = List.unmodifiable(queue);
    _currentIndex = initialIndex;
    _processingState = .loading;
    _position = Duration.zero;
    _duration = null;
    _errorMessage = null;
    notifyListeners();

    try {
      await _playbackService.setQueue(
        _queue.map((item) => item.path).toList(growable: false),
        initialIndex: initialIndex,
      );
      await _playbackService.play();
    } on Exception {
      _processingState = .idle;
      _isPlaying = false;
      _errorMessage = '无法播放这首歌曲，请确认文件仍然可访问。';
      notifyListeners();
    }
  }

  Future<void> togglePlayPause() async {
    if (!hasCurrentTrack) {
      return;
    }

    try {
      if (_processingState == .completed) {
        await _playbackService.seek(Duration.zero, index: _currentIndex);
        await _playbackService.play();
      } else if (isPlaying) {
        await _playbackService.pause();
      } else {
        await _playbackService.play();
      }
    } on Exception {
      _errorMessage = '播放器暂时无法响应，请重试。';
      notifyListeners();
    }
  }

  Future<void> previous() async {
    if (!hasCurrentTrack) {
      return;
    }
    if (_position.inSeconds > 3 || !canGoPrevious) {
      await _playbackService.seek(Duration.zero);
      return;
    }
    await _playbackService.seekToPrevious();
  }

  Future<void> next() async {
    if (canGoNext) {
      await _playbackService.seekToNext();
    }
  }

  void _onPlayingChanged(bool playing) {
    _isPlaying = playing;
    _notifyIfMounted();
  }

  void _onProcessingChanged(PlaybackProcessingState state) {
    _processingState = state;
    _notifyIfMounted();
  }

  void _onPositionChanged(Duration position) {
    _position = position;
    _notifyIfMounted();
  }

  void _onDurationChanged(Duration? duration) {
    _duration = duration;
    _notifyIfMounted();
  }

  void _onCurrentIndexChanged(int? index) {
    _currentIndex = index;
    _position = Duration.zero;
    _notifyIfMounted();
  }

  void _notifyIfMounted() {
    if (!_disposed) {
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _disposed = true;
    for (final subscription in _subscriptions) {
      unawaited(subscription.cancel());
    }
    unawaited(_playbackService.dispose());
    super.dispose();
  }
}
