import 'package:flutter/widgets.dart';
import 'package:forui/forui.dart';

import '../../../shared/widgets/empty_feature_state.dart';
import '../../../shared/widgets/feature_page.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) => FeaturePage(
    title: '曲库',
    child: EmptyFeatureState(
      icon: FLucideIcons.library,
      title: '还没有本地音乐',
      description: '扫描音乐目录后，可以按歌曲、专辑、艺术家和文件夹浏览。',
      actionLabel: '扫描音乐目录',
      onAction: () => showFToast(
        context: context,
        title: const Text('扫描功能尚未接入'),
        description: const Text('下一阶段将接入目录授权和媒体扫描。'),
      ),
    ),
  );
}
