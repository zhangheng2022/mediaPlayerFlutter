import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';

import '../../../shared/widgets/empty_feature_state.dart';
import '../../../shared/widgets/feature_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => FeaturePage(
    title: '你的音乐',
    actions: [
      FButton.icon(
        onPress: null,
        variant: .ghost,
        semanticsLabel: '曲库为空，暂时无法搜索',
        child: const Icon(FLucideIcons.search),
      ),
    ],
    child: EmptyFeatureState(
      icon: FLucideIcons.disc3,
      title: '让曲库响起来',
      description: '选择本地音乐目录后，这里会显示最近播放、最近添加和常听专辑。',
      actionLabel: '选择音乐目录',
      onAction: () => context.go('/library'),
    ),
  );
}
