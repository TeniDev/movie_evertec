import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../data/providers/providers.dart';
import '../../../gen/l10n.dart';

class SettingMobile extends ConsumerWidget {
  const SettingMobile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(isDarkModeProvider);
    final locale = ref.watch(localeProvider);

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            S.of(context).settings,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            ListTile(
              title: Text(
                S.of(context).language,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
              trailing: DropdownButtonHideUnderline(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: DropdownButton(
                    items: S.delegate.supportedLocales
                        .map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Text(
                                e.languageCode == 'en' ? 'English' : 'Español',
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                    value: locale,
                    onChanged: (value) => ref.read(localeProvider.notifier).changeLocale(value!),
                    icon: Icon(
                      PhosphorIcons.caretDown(),
                    ),
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text(
                S.of(context).darkMode,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
              trailing: Switch(
                value: isDarkMode,
                onChanged: (_) {
                  ref.read(isDarkModeProvider.notifier).changeTheme(!isDarkMode);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
