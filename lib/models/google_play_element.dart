import 'package:flutter/material.dart';

class GooglePlayElement {
  GooglePlayElement(
      this.icon, this.previewImages, this.name, this.score, this.price);
  Widget icon;
  List<Widget> previewImages;
  String name;
  double score;
  double? price;
}
