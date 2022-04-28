import 'package:flutter/material.dart';
import 'package:senior_tech/custom-widgets/grad_button.dart';
import 'package:senior_tech/custom-widgets/popup_message.dart';

class YoutubeMain extends StatelessWidget {
  const YoutubeMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: youTubeAppBar(context),
      body: youTubeBody(context),
    );
  }
}

PreferredSizeWidget youTubeAppBar(BuildContext context) {
  return AppBar(
    iconTheme: const IconThemeData(color: Colors.black),
    leading: IconButton(
      icon: const ImageIcon(
        AssetImage("assets/images/logos/YouTube_Logo.png"),
        size: 50,
        color: Colors.red,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    title: const Text("YouTube", style: TextStyle(color: Colors.black)),
    actions: [
      IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) => const PopupMessage(
                message:
                    "Dándole a este botón, puedes reproducir o poner en cola vídeos en tu televisor (si este es compatible).",
              ),
            );
          },
          icon: const Icon(Icons.tv_outlined)),
      IconButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => const PopupMessage(
              message: "",
            ),
          );
        },
        icon: const Icon(Icons.notifications_outlined),
      ),
      IconButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => const PopupMessage(
              message: "",
            ),
          );
        },
        icon: const Icon(Icons.search_outlined),
      ),
    ],
    backgroundColor: Colors.white,
  );
}

Widget youTubeBody(BuildContext context) {
  return Column();
}
