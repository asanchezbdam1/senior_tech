import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:senior_tech/models/google_play_app.dart';
import 'package:senior_tech/models/google_play_book.dart';
import 'package:senior_tech/models/google_play_element.dart';
import 'package:senior_tech/screens/apps/google-play.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GooglePlayMoreElements extends StatelessWidget {
  final Type elementType;
  final String title;

  const GooglePlayMoreElements(
      {Key? key, required this.elementType, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        shadowColor: Colors.transparent,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back, size: 40),
            onPressed: () => Navigator.pop(context)),
        title: Text(title),
      ),
      body: SingleChildScrollView(
          child: Row(children: [
        Expanded(
            child: Wrap(
                alignment: WrapAlignment.spaceEvenly,
                children: getRandomElements(context, elementType)))
      ])),
    );
  }
}

List<Widget> getRandomElements(BuildContext context, Type elementType) {
  List<Widget> elements = <Widget>[];
  Random rd = Random();
  int length = rd.nextInt(15) + 15;
  for (int i = 0; i < length; i++) {
    elements.add(getElement(context, getRandomElement(context, elementType)));
  }
  return elements;
}

GooglePlayElement getRandomElement(BuildContext context, Type elementType) {
  GooglePlayElement element;
  Random rd = Random();
  Widget image = getRandomImage(context);
  double? price = null;

  if (rd.nextBool() || elementType != GooglePlayApp) {
    price = rd.nextInt(9) + 0.99;
  }

  double score =
      num.parse((rd.nextDouble() * 2 + 3).toStringAsFixed(1)).toDouble();

  if (elementType == GooglePlayApp) {
    String name;

    if (price != null) {
      name = AppLocalizations.of(context)!.gpAppPaidName;
    } else {
      if (rd.nextBool()) {
        name = AppLocalizations.of(context)!.gpAppName;
      } else {
        name = AppLocalizations.of(context)!.gpAppLongName;
      }
    }

    element =
        GooglePlayApp(image, [image, image, image], name, score, price, null);
  } else {
    String name;

    if (price != null) {
      name = AppLocalizations.of(context)!.gpAppPaidName;
    } else {
      if (rd.nextBool()) {
        name = AppLocalizations.of(context)!.gpAppName;
      } else {
        name = AppLocalizations.of(context)!.gpAppLongName;
      }
    }

    element =
        GooglePlayApp(image, [image, image, image], name, score, price, null);
  }
  return element;
}

Widget getRandomImage(context) {
  return Container(child: getRandomIcon(), color: getRandomImageColor());
}

Icon getRandomIcon() {
  List<IconData> icons = [
    Icons.car_rental,
    Icons.door_front_door,
    CupertinoIcons.car_detailed,
    CupertinoIcons.cart,
    CupertinoIcons.paperplane,
    Icons.train,
    CupertinoIcons.moon_stars,
    CupertinoIcons.doc_fill,
    CupertinoIcons.alarm,
    CupertinoIcons.money_dollar,
    CupertinoIcons.money_euro_circle_fill,
    CupertinoIcons.ant_fill,
    Icons.analytics,
    Icons.cabin,
    Icons.cable
  ];
  Random rd = Random();
  int darkness = rd.nextInt(128);
  return Icon(icons[rd.nextInt(icons.length)],
      color: Color.fromARGB(255, darkness, darkness, darkness), size: 50);
}

Color getRandomImageColor() {
  List<Color> colors = const [
    Colors.red,
    Color.fromARGB(255, 216, 212, 87),
    Color.fromARGB(255, 106, 221, 56),
    Color.fromARGB(255, 87, 216, 190),
    Color.fromARGB(255, 87, 216, 115),
    Color.fromARGB(255, 157, 113, 227),
    Color.fromARGB(255, 87, 128, 216),
    Color.fromARGB(255, 239, 122, 196),
    Color.fromARGB(255, 227, 127, 137),
    Color.fromARGB(255, 248, 120, 1),
    Color.fromARGB(255, 126, 110, 186),
    Color.fromARGB(255, 117, 119, 240),
    Color.fromARGB(255, 87, 216, 147),
  ];
  Random rd = Random();
  return colors[rd.nextInt(colors.length)];
}
