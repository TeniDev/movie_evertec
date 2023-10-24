import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/constants/constants.dart';
import 'core/router/router.dart';
import 'core/theme/app_theme.dart';
import 'core/utils/utils.dart';
import 'data/providers/providers.dart';
import 'gen/l10n.dart';

class MovieEvertecApp extends ConsumerWidget {
  const MovieEvertecApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(appRouterProvider);
    final locale = ref.watch(localeProvider);
    final isDarkMode = ref.watch(isDarkModeProvider);

    _initApp(ref);

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

  void _initApp(WidgetRef ref) {
    final locale = ref.watch(localeProvider);

    final response = ref.read(movieRepositoryProvider).getMoviesGenres(language: locale.languageCode);

    response.fold(
      (l) => CustomLogger().error('Error: ${l.httpCode} - ${l.message}'),
      (r) => ref.read(genreProvider.notifier).update((_) => r),
    );
  }
}
