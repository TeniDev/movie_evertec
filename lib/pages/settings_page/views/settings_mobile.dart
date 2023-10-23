import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/providers/providers.dart';

class SettingMobile extends ConsumerWidget {
  const SettingMobile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(isDarkModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Configuración'),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            ListTile(
              title: const Text('Modo oscuro'),
              trailing: Switch(
                value: isDarkMode,
                onChanged: (_) {
                  ref.read(isDarkModeProvider.notifier).update((state) => !state);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
