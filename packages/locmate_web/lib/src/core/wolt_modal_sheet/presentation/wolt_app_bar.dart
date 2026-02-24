import 'package:flutter/material.dart';

/// A custom top bar with a gradient background and a search bar.
class WoltAppBar extends StatelessWidget {
  const WoltAppBar({
    required this.wizardTitle,
    required this.sectionTitle,
    this.extraPadding = EdgeInsets.zero,
    super.key,
  });

  final String wizardTitle;
  final String? sectionTitle;
  final EdgeInsets extraPadding;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16) + extraPadding,
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  wizardTitle,
                  style: theme.textTheme.titleLarge!.copyWith(
                    color: theme.appBarTheme.iconTheme?.color,
                  ),
                ),
                if (sectionTitle != null)
                  Text(
                    sectionTitle!,
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: theme.appBarTheme.iconTheme?.color!.withValues(
                        alpha: 0.7,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          CloseButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
