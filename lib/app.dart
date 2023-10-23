import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/constants/constants.dart';
import 'core/router/router.dart';
import 'core/theme/app_theme.dart';
import 'data/providers/providers.dart';
import 'gen/l10n.dart';

class MovieEvertecApp extends ConsumerWidget {
  const MovieEvertecApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(appRouterProvider);
    final locale = ref.watch(localeProvider);
    final isDarkMode = ref.watch(isDarkModeProvider);

    return MaterialApp.router(
      title: AppConstants.appName,
      theme: AppTheme(isDarkmode: isDarkMode).getTheme(),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: locale,
      supportedLocales: S.delegate.supportedLocales,
      routerConfig: appRouter,
    );
  }
}
