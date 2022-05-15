import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:senior_tech/custom-widgets/grad_button.dart';
import 'package:senior_tech/custom-widgets/popup_message.dart';
import 'package:senior_tech/models/google_play_app.dart';
import 'package:senior_tech/models/google_play_book.dart';
import 'package:senior_tech/models/google_play_element.dart';
import 'package:senior_tech/models/google_play_movie.dart';

class GooglePlayElementDetails extends StatelessWidget {
  final GooglePlayElement element;
  late BuildContext context;

  GooglePlayElementDetails({Key? key, required this.element}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          shadowColor: Colors.transparent,
          leading: IconButton(
              icon: const Icon(Icons.arrow_back, size: 40, color: Colors.black),
              onPressed: () => Navigator.pop(context))),
      body: getGooglePlayDetailsBody(context, element),
    );
  }
}

Widget getGooglePlayDetailsBody(
    BuildContext context, GooglePlayElement element) {
  return ListView(
    padding: const EdgeInsets.all(15),
    children: [
      Flexible(
          flex: 3,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                  fit: FlexFit.tight,
                  flex: 3,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: element.icon)),
              const SizedBox(width: 15),
              Expanded(flex: 7, child: Text(element.name)),
            ],
          )),
      const SizedBox(height: 15),
      Flexible(
          flex: 1,
          child: Center(
              child: Text(AppLocalizations.of(context)!.gpScore,
                  textScaleFactor: 0.7))),
      const SizedBox(height: 5),
      Flexible(
          flex: 1,
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(element.score.toString()),
            const Icon(Icons.star)
          ])),
      getButton(context, element),
      GradButton(
          gradient: const LinearGradient(colors: [
            Color.fromARGB(255, 215, 215, 215),
            Color.fromARGB(255, 215, 215, 215)
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          onPressed: () => showDialog(
              context: context,
              builder: (BuildContext context) => PopupMessage(
                    message: AppLocalizations.of(context)!.gpDetailsDescription,
                  )),
          child: Row(children: [
            Expanded(
                child: Text(AppLocalizations.of(context)!.gpDetailsDescription,
                    overflow: TextOverflow.ellipsis)),
            const Icon(Icons.arrow_forward, size: 40)
          ]))
    ],
  );
}

Widget getButton(BuildContext context, GooglePlayElement element) {
  String text = "";
  Color color = Colors.green;
  if (element.runtimeType == GooglePlayApp && element.price == null) {
    text = AppLocalizations.of(context)!.gpInstall;
  } else {
    text = AppLocalizations.of(context)!.gpBuyFor +
        " " +
        element.price.toString() +
        " €";
  }
  if (element.runtimeType == GooglePlayBook) {
    color = Colors.blue;
  } else if (element.runtimeType == GooglePlayMovie) {
    color = Colors.red;
  }
  ElevatedButton btn = ElevatedButton(
      style: ElevatedButton.styleFrom(primary: color),
      onPressed: () => showDialog(
          context: context,
          builder: (BuildContext context) => PopupMessage(
                message: AppLocalizations.of(context)!.gpDetailsButtonAction,
              )),
      child: Text(text,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          textScaleFactor: 0.8));
  return btn;
}
