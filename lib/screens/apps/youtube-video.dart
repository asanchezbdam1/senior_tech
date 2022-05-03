import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:senior_tech/custom-widgets/grad_button.dart';

class YouTubeVideo extends StatelessWidget {
  final BuildContext context;

  const YouTubeVideo({Key? key, required this.context}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getVideoUI(context),
      body: Column(children: []),
    );
  }
}

AppBar getVideoUI(BuildContext context) {
  return AppBar(
      backgroundColor: Colors.black87,
      iconTheme: const IconThemeData(color: Colors.white, size: 30),
      leading: IconButton(
        icon: const Icon(Icons.arrow_drop_down_rounded),
        onPressed: () => Navigator.pop(context),
      ),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.play_circle)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.cast_outlined)),
        IconButton(
            onPressed: () {}, icon: const Icon(Icons.closed_caption_outlined)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.settings_outlined)),
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(175),
        child: Column(children: [
          Row(children: [
            IconButton(
                iconSize: 35,
                onPressed: () {},
                icon: const Icon(Icons.skip_previous, color: Colors.white),
                padding: const EdgeInsets.all(30)),
            IconButton(
                iconSize: 60,
                onPressed: () {},
                icon: const Icon(Icons.play_arrow, color: Colors.white),
                padding: const EdgeInsets.all(30)),
            IconButton(
                iconSize: 35,
                onPressed: () {},
                icon: const Icon(Icons.skip_next, color: Colors.white),
                padding: const EdgeInsets.all(30)),
          ], mainAxisAlignment: MainAxisAlignment.center),
          Row(
            children: [
              GradButton(
                color: Colors.white,
                child: const Text("00:10/14:20", textScaleFactor: 0.75),
                onPressed: () {},
              ),
              const Expanded(
                  child: SizedBox(
                height: 10,
              )),
              IconButton(
                  iconSize: 30,
                  onPressed: () {},
                  icon: const Icon(Icons.fullscreen_exit, color: Colors.white))
            ],
          ),
          const SizedBox(
            height: 5,
            width: 400,
            child: DecoratedBox(
              decoration: BoxDecoration(color: Colors.red),
            ),
          )
        ]),
      ));
}
