import 'package:flutter_tts/flutter_tts.dart';

class TTSControl {
  static final FlutterTts _tts = getFlutterTts();

  static void speak(String text) async {
    _tts.speak(text);
  }

  static void stop() async {
    _tts.stop();
  }

  static FlutterTts getFlutterTts() {
    var tts = FlutterTts();
    tts.setLanguage("es-ES");
    return tts;
  }
}
