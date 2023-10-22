import 'package:envied/envied.dart';

import '../constants/constants.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: EnvConstants.tmdbAccessKey, obfuscate: true)
  static String tmdbAccessKey = _Env.tmdbAccessKey;
  @EnviedField(varName: EnvConstants.urlTmdb)
  static const String urlTmdb = _Env.urlTmdb;
}
