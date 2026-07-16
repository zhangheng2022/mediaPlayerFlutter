import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

class FeaturePage extends StatelessWidget {
  const FeaturePage({
    required this.title,
    required this.child,
    this.actions = const [],
    super.key,
  });

  final String title;
  final Widget child;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) => SafeArea(
    bottom: false,
    child: Column(
      children: [
        FHeader(title: Text(title), suffixes: actions),
        Expanded(child: child),
      ],
    ),
  );
}
