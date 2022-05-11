import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:senior_tech/app_settings.dart';

class TTSControl {
  static final FlutterTts _tts = getFlutterTts();

  static bool _isPlaying = false;

  static VoidCallback onStop = () {};

  static String _text = "";

  TTSControl() {
    _tts.completionHandler = stopped;
  }

  static void stopped() {
    onStop();
    _isPlaying = false;
  }

  static void changeState() {
    if (_isPlaying) {
      stop();
    } else {
      speak();
    }
  }

  static void setText(String text) {
    _text = text;
    if (AppSettings.autoplay) {
      speak();
    }
  }

  static void speak() async {
    _tts.speak(_text);
    _isPlaying = true;
  }

  static void stop() async {
    _tts.stop();
    _isPlaying = false;
  }

  static FlutterTts getFlutterTts() {
    var tts = FlutterTts();
    tts.setLanguage("es-ES");
    return tts;
  }
}
