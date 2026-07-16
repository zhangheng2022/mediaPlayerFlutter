import 'package:file_picker/file_picker.dart';

abstract interface class MusicFilePickerService {
  Future<List<String>?> chooseAudioFiles();
}

class FilePickerMusicFilePickerService implements MusicFilePickerService {
  const FilePickerMusicFilePickerService();

  @override
  Future<List<String>?> chooseAudioFiles() async {
    final result = await FilePicker.platform.pickFiles(
      dialogTitle: '导入本地音乐',
      type: FileType.audio,
      allowMultiple: true,
      withData: false,
    );
    if (result == null) {
      return null;
    }
    return List.unmodifiable(result.paths.whereType<String>());
  }
}
