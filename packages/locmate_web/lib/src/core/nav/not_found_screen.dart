import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class NotFoundScreen extends ConsumerWidget {
  const NotFoundScreen({required this.text, super.key});
  final String text;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(16),
        child: Center(child: Text(text)),
      ),
    );
  }
}
