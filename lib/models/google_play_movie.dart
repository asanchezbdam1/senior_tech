import 'package:flutter/material.dart';
import 'package:senior_tech/models/google_play_element.dart';

class GooglePlayMovie extends GooglePlayElement {
  GooglePlayMovie(Widget icon, List<Widget> previewImages, String name,
      double score, double? price)
      : super(icon, previewImages, name, score, price);
}
