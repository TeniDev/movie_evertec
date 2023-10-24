import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_evertec/app.dart';

import 'core/config/config.dart';

Future<void> main() async {
  await initConfig();

  runApp(
    const ProviderScope(
      child: MovieEvertecApp(),
    ),
  );
}
