import 'package:flutter/material.dart';

import '../../core/utils/utils.dart';
import 'views/movies_views.dart';

class MoviesPage extends BasePage {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  mobileBody(BuildContext context) {
    return const MoviesMobile();
  }
}
