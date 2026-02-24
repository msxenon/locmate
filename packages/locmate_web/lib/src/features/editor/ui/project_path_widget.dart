import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:locmate_web/src/core/env_config.dart';
import 'package:locmate_web/src/features/editor/logic/project_manager.dart';

class ProjectPathWidget extends ConsumerWidget {
  const ProjectPathWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String projectPath = '';
    if (EnvConfig.instance.env == EnvConfigEnum.sharedPrefs) {
      projectPath = 'No project path, using Shared Prefs.';
    } else {
      projectPath = ref.watch(projectManagerProvider).value?.projectPath ?? '';
    }

    return Text('Path: $projectPath');
  }
}
