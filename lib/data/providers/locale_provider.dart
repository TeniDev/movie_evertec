import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_evertec/gen/l10n.dart';

final localeProvider = NotifierProvider<_LocaleProvider, Locale>(() => _LocaleProvider());

class _LocaleProvider extends Notifier<Locale> {
  @override
  Locale build() {
    final String defaultLocale = kIsWeb ? 'es' : Platform.localeName;
    return Locale(defaultLocale.split('_')[0]);
  }

  changeLocale(Locale locale) async {
    state = S.delegate.supportedLocales.contains(locale) ? locale : const Locale('es');
  }
}
