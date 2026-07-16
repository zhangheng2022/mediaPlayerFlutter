import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';

import '../../shared/widgets/mini_player.dart';

// Hallmark · pre-emit critique: P5 H4 E4 S4 R5 V5
// Hallmark · macrostructure: Workbench · genre: atmospheric
// Theme: dark warm-neutral canvas · phosphor-lime accent · motion-cut.
const double _desktopNavigationBreakpoint = 800;

class AppShell extends StatelessWidget {
  const AppShell({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  void _selectDestination(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (context, constraints) {
      final desktop = constraints.maxWidth >= _desktopNavigationBreakpoint;

      return FScaffold(
        childPad: false,
        sidebar: desktop
            ? SizedBox(
                width: 248,
                child: _DesktopSidebar(
                  selectedIndex: navigationShell.currentIndex,
                  onSelect: _selectDestination,
                ),
              )
            : null,
        footer: desktop
            ? null
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const MiniPlayer(),
                  _MobileNavigationBar(
                    selectedIndex: navigationShell.currentIndex,
                    onSelect: _selectDestination,
                  ),
                ],
              ),
        child: desktop
            ? Column(
                children: [
                  Expanded(child: navigationShell),
                  const MiniPlayer(),
                ],
              )
            : navigationShell,
      );
    },
  );
}

class _MobileNavigationBar extends StatelessWidget {
  const _MobileNavigationBar({
    required this.selectedIndex,
    required this.onSelect,
  });

  final int selectedIndex;
  final ValueChanged<int> onSelect;

  @override
  Widget build(BuildContext context) => FBottomNavigationBar(
    index: selectedIndex,
    onChange: onSelect,
    children: const [
      FBottomNavigationBarItem(
        icon: Icon(FLucideIcons.home),
        label: Text('首页'),
      ),
      FBottomNavigationBarItem(
        icon: Icon(FLucideIcons.library),
        label: Text('曲库'),
      ),
      FBottomNavigationBarItem(
        icon: Icon(FLucideIcons.listMusic),
        label: Text('歌单'),
      ),
      FBottomNavigationBarItem(
        icon: Icon(FLucideIcons.settings),
        label: Text('设置'),
      ),
    ],
  );
}

class _DesktopSidebar extends StatelessWidget {
  const _DesktopSidebar({required this.selectedIndex, required this.onSelect});

  final int selectedIndex;
  final ValueChanged<int> onSelect;

  @override
  Widget build(BuildContext context) => FSidebar(
    header: Padding(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 12),
      child: Text('音乐播放器', style: Theme.of(context).textTheme.titleLarge),
    ),
    children: [
      _item(0, FLucideIcons.home, '首页'),
      _item(1, FLucideIcons.library, '曲库'),
      _item(2, FLucideIcons.listMusic, '歌单'),
      _item(3, FLucideIcons.settings, '设置'),
    ],
  );

  Widget _item(int index, IconData icon, String label) => FSidebarItem(
    selected: selectedIndex == index,
    onPress: () => onSelect(index),
    icon: Icon(icon),
    label: Text(label),
  );
}
