import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_evertec/gen/fonts.gen.dart';
import 'package:movie_evertec/gen/l10n.dart';

import 'data/providers/providers.dart';

class MovieEvertecApp extends ConsumerWidget {
  const MovieEvertecApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);

    return MaterialApp(
      title: 'Movie Evertec App',
      theme: ThemeData(
        fontFamily: FontFamily.manrope,
        useMaterial3: true,
      ),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: locale,
      supportedLocales: S.delegate.supportedLocales,
      home: const HomePage(),
    );
  }
}

class HomePage extends ConsumerWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(localeProvider);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(localeProvider.notifier).changeLocale(
                locale.languageCode == 'es' ? const Locale('en') : const Locale('es'),
              );
        },
        child: const Icon(Icons.language),
      ),
      body: Center(
        child: Text(
          S.of(context).helloWorld,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
