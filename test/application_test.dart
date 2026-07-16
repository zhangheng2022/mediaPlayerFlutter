import 'dart:ui' show Size;

import 'package:flutter_test/flutter_test.dart';
import 'package:forui/forui.dart';
import 'package:media_player_flutter/app/app.dart';
import 'package:media_player_flutter/app/router.dart';

void main() {
  testWidgets('应用使用 Forui 主题并显示产品首页', (tester) async {
    await tester.pumpWidget(Application(router: createRouter()));

    expect(find.byType(FTheme), findsOneWidget);
    expect(find.byType(FScaffold), findsOneWidget);
    expect(find.text('你的音乐'), findsOneWidget);
    expect(find.text('让曲库响起来'), findsOneWidget);
    expect(find.text('尚未选择歌曲'), findsOneWidget);
  });

  testWidgets('底部导航可以切换到曲库', (tester) async {
    await tester.pumpWidget(Application(router: createRouter()));

    await tester.tap(find.text('曲库'));
    await tester.pumpAndSettle();

    expect(find.text('还没有本地音乐'), findsOneWidget);
    expect(find.text('扫描音乐目录'), findsOneWidget);
  });

  testWidgets('首页主操作可以进入曲库', (tester) async {
    await tester.pumpWidget(Application(router: createRouter()));

    await tester.tap(find.text('选择音乐目录'));
    await tester.pumpAndSettle();

    expect(find.text('还没有本地音乐'), findsOneWidget);
  });

  testWidgets('320 像素窄屏不会产生布局异常', (tester) async {
    tester.view.physicalSize = const Size(320, 700);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(Application(router: createRouter()));
    await tester.pumpAndSettle();

    expect(tester.takeException(), isNull);
    expect(find.text('首页'), findsOneWidget);
    expect(find.text('设置'), findsOneWidget);
  });
}
