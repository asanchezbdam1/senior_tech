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
      leading: GradButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.play_arrow_rounded,
              color: Colors.white,
            ),
          ),
        ),
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
