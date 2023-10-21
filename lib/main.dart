import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_evertec/app.dart';

void main() => runApp(
      const ProviderScope(
        child: MovieEvertecApp(),
      ),
    );
