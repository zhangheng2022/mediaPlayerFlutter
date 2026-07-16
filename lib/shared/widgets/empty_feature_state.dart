import 'package:flutter/material.dart';
import 'package:forui/forui.dart';

class EmptyFeatureState extends StatelessWidget {
  const EmptyFeatureState({
    required this.icon,
    required this.title,
    required this.description,
    this.actionLabel,
    this.onAction,
    super.key,
  });

  final IconData icon;
  final String title;
  final String description;
  final String? actionLabel;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    final colors = context.theme.colors;
    final textTheme = Theme.of(context).textTheme;

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 420),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  color: colors.secondary,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: SizedBox.square(
                  dimension: 80,
                  child: Icon(icon, size: 32),
                ),
              ),
              const SizedBox(height: 24),
              Text(title, style: textTheme.headlineSmall),
              const SizedBox(height: 8),
              Text(
                description,
                textAlign: TextAlign.center,
                style: textTheme.bodyMedium?.copyWith(
                  color: colors.mutedForeground,
                ),
              ),
              if (actionLabel case final label?) ...[
                const SizedBox(height: 24),
                FButton(
                  onPress: onAction,
                  prefix: const Icon(FLucideIcons.plus),
                  child: Text(label),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
