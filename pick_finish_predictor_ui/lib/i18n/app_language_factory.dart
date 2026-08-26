// Location: lib/core/i18n/app_language_factory.dart
import 'app_strings.dart';
import 'strings_en.dart';
import 'strings_de.dart'; //keep
import 'strings_es.dart'; //keep
import 'strings_zh.dart'; //keep
import 'strings_hi.dart'; //keep

abstract class AppLanguageFactory {
  static AppStrings fromLanguageCode(String code) {
    switch (code.toLowerCase()) {
      case 'de': return StringsDe();
      case 'es': return StringsEs();
      case 'zh': return StringsZh();
      case 'hi': return StringsHi();
      default:
        return StringsEn();
    }
  }
}