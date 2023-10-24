import 'package:flutter/material.dart';

import '../../core/utils/utils.dart';
import 'views/details_movie_views.dart';

class DetailsMoviePage extends BasePage {
  const DetailsMoviePage({Key? key}) : super(key: key);

  @override
  Widget? mobileBody(BuildContext context) {
    return const DetailsMovieMobile();
  }
}
