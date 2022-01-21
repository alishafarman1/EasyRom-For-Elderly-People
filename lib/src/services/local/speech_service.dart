import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_tts/flutter_tts.dart';

enum Languages { en_US, ur_PK }

class SpeechService {
  FlutterTts flutterTts = FlutterTts();
  Languages selectedLanguage = Languages.en_US;

  String get languageTTSstr =>
      describeEnum(selectedLanguage).replaceFirst("_", "-");

  SpeechService() {
    flutterTts.setLanguage(languageTTSstr);
    flutterTts.awaitSpeakCompletion(false);
    flutterTts.awaitSynthCompletion(false);
  }

  setLanguage(BuildContext context, Languages language) {
    selectedLanguage = language;
    flutterTts.setLanguage(languageTTSstr);
    EasyLocalization.of(context)?.setLocale(
        Locale(languageTTSstr.split("-")[0], languageTTSstr.split("-")[1]));
  }

  speak(String text, {bool shouldForceEn = false}) async {
    if (shouldForceEn) {
      await flutterTts.setLanguage("en-US");
      await flutterTts.speak(text);
      await flutterTts.setLanguage(languageTTSstr);
    } else {
      await flutterTts.speak(text);
    }
  }
}
