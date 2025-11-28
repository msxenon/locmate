import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:locmate_web/src/features/editor/logic/project_manager.dart';

class CreateProjectWidget extends ConsumerWidget {
  const CreateProjectWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            ref.read(projectManagerProvider.notifier).createDemoProject();
          },
          child: Text('Create project'),
        ),
      ],
    );
  }
}
