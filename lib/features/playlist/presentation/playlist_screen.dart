import 'package:flutter/widgets.dart';
import 'package:forui/forui.dart';

import '../../../shared/widgets/empty_feature_state.dart';
import '../../../shared/widgets/feature_page.dart';

class PlaylistScreen extends StatelessWidget {
  const PlaylistScreen({super.key});

  @override
  Widget build(BuildContext context) => FeaturePage(
    title: '歌单',
    child: EmptyFeatureState(
      icon: FLucideIcons.listMusic,
      title: '建立你的第一张歌单',
      description: '收藏的歌曲、自建歌单和播放历史会集中显示在这里。',
      actionLabel: '新建歌单',
      onAction: () => showFToast(
        context: context,
        title: const Text('歌单功能尚未接入'),
        description: const Text('完成本地曲库后，这里会接入歌单创建与管理。'),
      ),
    ),
  );
}
