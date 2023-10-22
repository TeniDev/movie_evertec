import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'TMDB_ACCESS_KEY', obfuscate: true)
  static String tmdbAccessKey = _Env.tmdbAccessKey;
  @EnviedField(varName: 'URL_TMBD')
  static const String urlTmdb = _Env.urlTmdb;
}
