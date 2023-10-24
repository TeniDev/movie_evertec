// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Proximamente`
  String get comingSoon {
    return Intl.message(
      'Proximamente',
      name: 'comingSoon',
      desc: '',
      args: [],
    );
  }

  /// `Filtros`
  String get filters {
    return Intl.message(
      'Filtros',
      name: 'filters',
      desc: '',
      args: [],
    );
  }

  /// `No se encontraron películas.`
  String get noMoviesFound {
    return Intl.message(
      'No se encontraron películas.',
      name: 'noMoviesFound',
      desc: '',
      args: [],
    );
  }

  /// `Fecha de lanzamiento: `
  String get releaseDate {
    return Intl.message(
      'Fecha de lanzamiento: ',
      name: 'releaseDate',
      desc: '',
      args: [],
    );
  }

  /// `Ver detalle`
  String get seeDetail {
    return Intl.message(
      'Ver detalle',
      name: 'seeDetail',
      desc: '',
      args: [],
    );
  }

  /// `No hay detalle`
  String get noDetail {
    return Intl.message(
      'No hay detalle',
      name: 'noDetail',
      desc: '',
      args: [],
    );
  }

  /// `Configuración`
  String get settings {
    return Intl.message(
      'Configuración',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Idioma`
  String get language {
    return Intl.message(
      'Idioma',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Modo oscuro`
  String get darkMode {
    return Intl.message(
      'Modo oscuro',
      name: 'darkMode',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
