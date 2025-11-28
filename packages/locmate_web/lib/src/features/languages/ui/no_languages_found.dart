import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NoLanguagesFound extends ConsumerWidget {
  const NoLanguagesFound({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text('No languages found');
  }
}
