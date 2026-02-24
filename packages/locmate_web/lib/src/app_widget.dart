import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:locmate_web/src/core/locmate_theme.dart';
import 'package:locmate_web/src/core/logger/ui/debug_wrapper.dart';
import 'package:locmate_web/src/core/nav/app_router.dart';
import 'package:locmate_web/src/features/editor/logic/project_manager.dart';

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  late final AppRouter _router = AppRouter(ref: ref);
  final valueChangedListener = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    final proj = ref.read(projectManagerProvider.notifier);
    proj.listenSelf(
      (old, state) {
        valueChangedListener.value = valueChangedListener.value + 1;
      },
      onError: (error, stackTrace) {
        valueChangedListener.value = valueChangedListener.value + 1;
      },
    );
    return MaterialApp.router(
      color: Colors.blue,
      title: 'Locmate',
      theme: LocmateTheme.lightTheme,
      darkTheme: LocmateTheme.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        LocaleNamesLocalizationsDelegate(),
      ],
      builder: (context, child) {
        ref.watch(projectManagerProvider);
        return DebugWrapper(
          enabled: true,
          router: _router,
          child: child ?? SizedBox(),
        );
      },
      supportedLocales: [
        Locale('en', ''),
      ],
      routerConfig: _router.config(reevaluateListenable: valueChangedListener),
    );
  }
}
