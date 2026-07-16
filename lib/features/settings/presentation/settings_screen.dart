import 'package:flutter/widgets.dart';
import 'package:forui/forui.dart';

import '../../../shared/widgets/empty_feature_state.dart';
import '../../../shared/widgets/feature_page.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) => const FeaturePage(
    title: '设置',
    child: EmptyFeatureState(
      icon: FLucideIcons.settings,
      title: '偏好设置即将接入',
      description: '后续可以管理音乐目录、主题、扫描规则和播放行为。',
    ),
  );
}
