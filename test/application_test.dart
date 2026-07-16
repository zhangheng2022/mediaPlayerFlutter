import 'dart:ui' show Size;

import 'package:flutter_test/flutter_test.dart';
import 'package:forui/forui.dart';
import 'package:media_player_flutter/app/app.dart';
import 'package:media_player_flutter/app/app_dependencies.dart';
import 'package:media_player_flutter/app/router.dart';
import 'package:media_player_flutter/features/library/application/library_controller.dart';
import 'package:media_player_flutter/features/player/application/player_controller.dart';

import 'support/fakes.dart';

AppDependencies testDependencies({FakeMusicLibraryRepository? repository}) {
  final playback = FakePlaybackService();
  return AppDependencies(
    library: LibraryController(repository ?? FakeMusicLibraryRepository()),
    player: PlayerController(playback),
  );
}

void main() {
  testWidgets('应用使用 Forui 主题并显示产品首页', (tester) async {
    final dependencies = testDependencies();
    addTearDown(dependencies.dispose);
    await tester.pumpWidget(
      Application(router: createRouter(), dependencies: dependencies),
    );

    expect(find.byType(FTheme), findsOneWidget);
    expect(find.byType(FScaffold), findsOneWidget);
    expect(find.text('你的音乐'), findsOneWidget);
    expect(find.text('让曲库响起来'), findsOneWidget);
    expect(find.text('尚未选择歌曲'), findsOneWidget);
  });

  testWidgets('底部导航可以切换到曲库', (tester) async {
    final dependencies = testDependencies();
    addTearDown(dependencies.dispose);
    await tester.pumpWidget(
      Application(router: createRouter(), dependencies: dependencies),
    );

    await tester.tap(find.text('曲库'));
    await tester.pumpAndSettle();

    expect(find.text('还没有本地音乐'), findsOneWidget);
    expect(find.text('导入本地音乐'), findsOneWidget);
  });

  testWidgets('首页主操作可以进入曲库', (tester) async {
    final dependencies = testDependencies();
    addTearDown(dependencies.dispose);
    await tester.pumpWidget(
      Application(router: createRouter(), dependencies: dependencies),
    );

    await tester.tap(find.text('导入本地音乐'));
    await tester.pumpAndSettle();

    expect(find.text('还没有本地音乐'), findsOneWidget);
  });

  testWidgets('320 像素窄屏不会产生布局异常', (tester) async {
    tester.view.physicalSize = const Size(320, 700);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final dependencies = testDependencies();
    addTearDown(dependencies.dispose);
    await tester.pumpWidget(
      Application(router: createRouter(), dependencies: dependencies),
    );
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
    expect(find.text('首页'), findsOneWidget);
    expect(find.text('设置'), findsOneWidget);
  });

  testWidgets('导入后点击歌曲会同步更新迷你播放器', (tester) async {
    final repository = FakeMusicLibraryRepository(
      tracks: [sampleTrack('晴天', artist: '周杰伦')],
    );
    final dependencies = testDependencies(repository: repository);
    addTearDown(dependencies.dispose);
    await dependencies.library.importMusic();

    await tester.pumpWidget(
      Application(router: createRouter(), dependencies: dependencies),
    );
    await tester.tap(find.text('曲库'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('晴天'));
    await tester.pump(const Duration(milliseconds: 100));

    expect(find.text('晴天'), findsNWidgets(2));
    expect(find.text('周杰伦'), findsNWidgets(2));
    expect(dependencies.player.isPlaying, isTrue);
  });

  testWidgets('320 像素下播放态迷你播放器不会溢出', (tester) async {
    tester.view.physicalSize = const Size(320, 700);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    final repository = FakeMusicLibraryRepository(
      tracks: [sampleTrack('很长很长的歌曲名称', artist: '很长的艺术家名称')],
    );
    final dependencies = testDependencies(repository: repository);
    addTearDown(dependencies.dispose);
    await dependencies.library.importMusic();

    await tester.pumpWidget(
      Application(router: createRouter(), dependencies: dependencies),
    );
    await tester.tap(find.text('曲库'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('很长很长的歌曲名称'));
    await tester.pump(const Duration(milliseconds: 100));

    expect(tester.takeException(), isNull);
    expect(find.text('很长很长的歌曲名称'), findsNWidgets(2));
  });
}
