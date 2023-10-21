import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_evertec/gen/fonts.gen.dart';
import 'package:movie_evertec/gen/l10n.dart';

import 'core/router/router.dart';
import 'data/providers/providers.dart';

class MovieEvertecApp extends ConsumerWidget {
  const MovieEvertecApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(appRouterProvider);
    final locale = ref.watch(localeProvider);

    return MaterialApp.router(
      title: 'Movie Evertec App',
      theme: ThemeData(
        fontFamily: FontFamily.manrope,
        useMaterial3: true,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        focusColor: Colors.transparent,
      ),
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
