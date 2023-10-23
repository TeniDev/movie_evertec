import 'package:flutter/material.dart';

import '../../core/utils/utils.dart';
import 'views/settings_views.dart';

class SettingsPage extends BasePage {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget? mobileBody(BuildContext context) {
    return const SettingMobile();
  }
}
