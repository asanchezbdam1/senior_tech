import 'package:flutter/src/widgets/framework.dart';
import 'package:senior_tech/models/google_play_element.dart';

class GooglePlayApp extends GooglePlayElement {
  GooglePlayApp(Widget icon, List<Widget> previewImages, String name,
      double score, double? price, this.categories)
      : super(icon, previewImages, name, score, price);
  List<String>? categories;
}
