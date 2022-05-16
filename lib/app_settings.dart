import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSettings {
  static double fontSize = 1.5;
  static bool autoplay = false;

  static VoidCallback updateResources = () {};

  static Future<bool> save() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    Map<String, dynamic> settings = {
      'fontSize': fontSize,
      'autoplay': autoplay
    };

    return await prefs.setString('settings', jsonEncode(settings));
  }

  static Future<bool> load() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      String settingsPref = prefs.getString('settings')!;

      Map<String, dynamic> settings =
          jsonDecode(settingsPref) as Map<String, dynamic>;

      fontSize = settings["fontSize"];
      autoplay = settings["autoplay"];

      return true;
    } catch (e) {}
    return false;
  }
}
