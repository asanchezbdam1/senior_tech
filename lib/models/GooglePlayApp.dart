import 'package:flutter/src/widgets/framework.dart';
import 'package:senior_tech/models/GooglePlayElement.dart';

class GooglePlayApp extends GooglePlayElement {
  GooglePlayApp(
      Widget icon, String name, double score, double? price, this.categories)
      : super(icon, name, score, price);
  List<String> categories;
}
