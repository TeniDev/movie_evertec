import 'package:flutter/material.dart';

import '../../core/utils/utils.dart';
import 'views/search_views.dart';

class SearchPage extends BasePage {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget? mobileBody(BuildContext context) {
    return const SearchMobile();
  }
}
