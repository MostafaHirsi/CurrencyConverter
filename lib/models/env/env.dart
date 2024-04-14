import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
final class Env {
  @EnviedField(varName: 'CURRENCY_API_KEY', obfuscate: true)
  static final String currencyApiKey = _Env.currencyApiKey;
}
