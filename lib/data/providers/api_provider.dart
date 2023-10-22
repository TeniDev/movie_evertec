import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/utils/utils.dart';
import '../helpers/helpers.dart';

final apiProvider = Provider<ApiHelper>(
  (ref) => ApiHelper(
    baseUrl: Env.urlTmdb,
  ),
);
