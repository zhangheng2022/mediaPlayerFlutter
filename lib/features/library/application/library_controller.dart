import 'dart:io';

import 'package:flutter/foundation.dart';

import '../domain/audio_track.dart';
import '../domain/music_library_repository.dart';

enum LibraryStatus { idle, scanning, ready, error }

class LibraryController extends ChangeNotifier {
  LibraryController(this._repository);

  final MusicLibraryRepository _repository;

  LibraryStatus _status = .idle;
  List<AudioTrack> _tracks = const [];
  String? _errorMessage;

  LibraryStatus get status => _status;
  List<AudioTrack> get tracks => _tracks;
  String? get errorMessage => _errorMessage;
  bool get isScanning => _status == .scanning;
  bool get hasTracks => _tracks.isNotEmpty;

  Future<void> importMusic() async {
    if (isScanning) {
      return;
    }

    final previousStatus = _status;
    _status = .scanning;
    _errorMessage = null;
    notifyListeners();

    try {
      final imported = await _repository.importTracks();
      if (imported == null) {
        _status = previousStatus;
        notifyListeners();
        return;
      }
      final byId = <String, AudioTrack>{
        for (final track in _tracks) track.id: track,
        for (final track in imported) track.id: track,
      };
      _tracks = List.unmodifiable(byId.values);
      _status = .ready;
      notifyListeners();
    } on Exception catch (error) {
      _setError(error);
    }
  }

  void _setError(Exception error) {
    _status = .error;
    _errorMessage = switch (error) {
      FileSystemException() => '无法读取选中的音频，请重新选择。',
      _ => '导入音乐时遇到问题，请稍后重试。',
    };
    notifyListeners();
  }
}
