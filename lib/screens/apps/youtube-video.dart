import 'package:flutter/material.dart';
import 'package:senior_tech/custom-widgets/grad_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:senior_tech/screens/apps/youtube.dart';

class YouTubeVideo extends StatelessWidget {
  final BuildContext context;

  const YouTubeVideo({Key? key, required this.context}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getVideoUI(context),
      body: ListView(children: [getTopSection(context)]),
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

Widget getTopSection(BuildContext context) {
  return Column(
    children: [
      ExpansionTile(
        backgroundColor: Colors.transparent,
        title: Text(AppLocalizations.of(context)!.ytVideoTitle),
        subtitle: Text(AppLocalizations.of(context)!.ytVideoData,
            textScaleFactor: 0.75),
        children: [
          Text(AppLocalizations.of(context)!.ytVideoDescription,
              textScaleFactor: 0.9)
        ],
        childrenPadding: EdgeInsets.all(10),
        iconColor: Colors.black,
        textColor: Colors.black,
        collapsedIconColor: Colors.black,
        collapsedTextColor: Colors.black,
      ),
      Center(
          child: Container(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                      width: 100,
                      child: Column(
                        children: [
                          IconButton(
                            iconSize: 30,
                            onPressed: () {},
                            icon: Icon(
                              Icons.thumb_up,
                              semanticLabel:
                                  AppLocalizations.of(context)!.ytLikes,
                            ),
                            tooltip: AppLocalizations.of(context)!.ytLikes,
                          ),
                          Text(AppLocalizations.of(context)!.ytLikes,
                              textScaleFactor: 0.75),
                        ],
                      )),
                  Container(
                      width: 100,
                      child: Column(
                        children: [
                          IconButton(
                            iconSize: 30,
                            onPressed: () {},
                            icon: Icon(
                              Icons.thumb_down_outlined,
                              semanticLabel:
                                  AppLocalizations.of(context)!.ytDislikes,
                            ),
                            tooltip: AppLocalizations.of(context)!.ytDislikes,
                          ),
                          Text(AppLocalizations.of(context)!.ytDislikes,
                              textScaleFactor: 0.75),
                        ],
                      )),
                  Container(
                      width: 100,
                      child: Column(
                        children: [
                          IconButton(
                            iconSize: 30,
                            onPressed: () {},
                            icon: Icon(
                              Icons.share_outlined,
                              semanticLabel:
                                  AppLocalizations.of(context)!.ytShare,
                            ),
                            tooltip: AppLocalizations.of(context)!.ytShare,
                          ),
                          Text(AppLocalizations.of(context)!.ytShare,
                              textScaleFactor: 0.75),
                        ],
                      )),
                  Container(
                      width: 100,
                      child: Column(
                        children: [
                          IconButton(
                            iconSize: 30,
                            onPressed: () {},
                            icon: Icon(
                              Icons.download_outlined,
                              semanticLabel:
                                  AppLocalizations.of(context)!.ytDownload,
                            ),
                            tooltip: AppLocalizations.of(context)!.ytDownload,
                          ),
                          Text(AppLocalizations.of(context)!.ytDownload,
                              textScaleFactor: 0.75),
                        ],
                      )),
                ],
              ))),
      Row(
        children: [
          youTubeChannelAvatarIcon(context, EdgeInsets.all(5), 40, 40,
              Color.fromARGB(255, 238, 30, 30), Colors.yellow),
          Expanded(
            child: GradButton(
                onPressed: () {},
                child: Text(
                  AppLocalizations.of(context)!.ytVideoChannel,
                  overflow: TextOverflow.ellipsis,
                )),
          ),
          GradButton(
              color: Colors.red,
              onPressed: () {},
              child: Text(
                AppLocalizations.of(context)!.ytSubscribe,
                textScaleFactor: 0.8,
              ))
        ],
      )
    ],
  );
}
