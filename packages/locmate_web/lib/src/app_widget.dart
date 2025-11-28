import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_localized_locales/flutter_localized_locales.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    final defaultBorderSide = BorderSide(
      color: Colors.grey,
      width: 1,
    );
    final defaultBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: defaultBorderSide,
    );
    return MaterialApp.router(
      color: Colors.blue,
      title: 'Locmate',
      theme: ThemeData(
        useMaterial3: false,
        primaryColor: Colors.blue,
        dividerTheme: DividerThemeData(
            thickness: 1, color: Colors.grey.withValues(alpha: 0.2)),
        scaffoldBackgroundColor: Color.fromARGB(255, 250, 250, 250),
        dividerColor: Colors.grey,
        checkboxTheme: CheckboxThemeData(
          fillColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return Colors.blue;
            }
            return Colors.white;
          }),
          side: BorderSide(color: Colors.grey, width: 1.0),
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(2.0)),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: defaultBorder,
          focusedBorder: defaultBorder.copyWith(
            borderSide: BorderSide(
              color: Colors.blue,
              width: 2,
            ),
          ),
          errorBorder: defaultBorder.copyWith(
            borderSide: defaultBorderSide.copyWith(
              color: Colors.red,
            ),
          ),
          focusedErrorBorder: defaultBorder.copyWith(
            borderSide: defaultBorderSide.copyWith(
              color: Colors.red,
            ),
          ),
          disabledBorder: defaultBorder.copyWith(
            borderSide: defaultBorderSide.copyWith(
              color: Colors.grey.withValues(alpha: 0.1),
            ),
          ),
          enabledBorder: defaultBorder,
          outlineBorder: defaultBorderSide,
          activeIndicatorBorder: defaultBorderSide,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
        ),
      ),
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
