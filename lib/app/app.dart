import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:go_router/go_router.dart';

import '../theme/theme.dart';
import 'app_dependencies.dart';
import 'router.dart';
import 'app_scope.dart';

class Application extends StatefulWidget {
  const Application({this.router, this.dependencies, super.key});

  final GoRouter? router;
  final AppDependencies? dependencies;

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  late final AppDependencies _dependencies =
      widget.dependencies ?? AppDependencies.production();
  late final bool _ownsDependencies = widget.dependencies == null;

  @override
  void dispose() {
    if (_ownsDependencies) {
      _dependencies.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => AppScope(
    dependencies: _dependencies,
    child: MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: '音乐播放器',
      routerConfig: widget.router ?? appRouter,
      supportedLocales: FLocalizations.supportedLocales,
      localizationsDelegates: const [...FLocalizations.localizationsDelegates],
      theme: lightTheme.toApproximateMaterialTheme(),
      darkTheme: darkTheme.toApproximateMaterialTheme(),
      themeMode: ThemeMode.dark,
      builder: (context, child) => FTheme(
        data: Theme.brightnessOf(context) == .light ? lightTheme : darkTheme,
        child: FToaster(
          child: FTooltipGroup(child: child ?? const SizedBox.shrink()),
        ),
      ),
    ),
  );
}
