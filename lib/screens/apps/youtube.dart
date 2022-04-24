import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:senior_tech/custom-widgets/grad_button.dart';

class YoutubeMain extends StatelessWidget {
  const YoutubeMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: youTubeAppBar(context),
    );
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
      actions: const [
        Icon(Icons.tv_outlined),
        Icon(Icons.notifications_outlined),
        Icon(Icons.search_outlined),
      ],
      backgroundColor: Colors.white,
    );
  }
}
