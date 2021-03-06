import 'package:flutter/material.dart';
import 'package:senior_tech/custom-widgets/grad_button.dart';
import 'package:senior_tech/custom-widgets/popup_message.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:senior_tech/screens/apps/youtube-video.dart';
import 'package:senior_tech/tts-control.dart';

class YoutubeMain extends StatefulWidget {
  final BuildContext context;
  const YoutubeMain({Key? key, required this.context}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _YoutubeMainState(context);
}

class _YoutubeMainState extends State<YoutubeMain> {
  final BuildContext context;
  int _index = 0;
  List<Widget> _tabBodies = [];
  late List<String> _texts;

  void _tabChanged(int index) {
    setState(() {
      _index = index;
    });
  }

  _YoutubeMainState(this.context);
  @override
  Widget build(BuildContext context) {
    _texts = [
      AppLocalizations.of(context)!.ytVideosText,
      AppLocalizations.of(context)!.ytShortsText,
      AppLocalizations.of(context)!.ytAddText,
      AppLocalizations.of(context)!.ytSubsText,
      AppLocalizations.of(context)!.ytLibraryText
    ];
    _tabBodies = [
      youTubeVideos(context),
      Padding(
          padding: const EdgeInsets.all(20),
          child:
              Center(child: Text(AppLocalizations.of(context)!.ytShortsText))),
      Padding(
          padding: const EdgeInsets.all(20),
          child: Center(child: Text(AppLocalizations.of(context)!.ytAddText))),
      youTubeSubs(context),
      Padding(
          padding: const EdgeInsets.all(20),
          child:
              Center(child: Text(AppLocalizations.of(context)!.ytLibraryText))),
    ];
    return Scaffold(
      appBar: youTubeAppBar(context),
      body: _tabBodies[_index],
      bottomNavigationBar: youTubeTabBar(context, _tabChanged, _index),
    );
  }
}

Widget youTubeSubs(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        flexibleSpace: Row(
          children: [
            youTubeChannelAvatarIcon(
                context,
                const EdgeInsets.all(5),
                45,
                45,
                const Color.fromARGB(255, 250, 255, 98),
                const Color.fromARGB(255, 243, 90, 19)),
            youTubeChannelAvatarIcon(
                context,
                const EdgeInsets.all(5),
                45,
                45,
                const Color.fromARGB(255, 223, 50, 23),
                const Color.fromARGB(255, 176, 243, 19)),
            youTubeChannelAvatarIcon(
                context,
                const EdgeInsets.all(5),
                45,
                45,
                const Color.fromARGB(255, 31, 188, 219),
                const Color.fromARGB(255, 41, 243, 19)),
            youTubeChannelAvatarIcon(
                context,
                const EdgeInsets.all(5),
                45,
                45,
                const Color.fromARGB(255, 37, 31, 219),
                const Color.fromARGB(255, 150, 19, 243)),
            youTubeChannelAvatarIcon(
                context,
                const EdgeInsets.all(5),
                45,
                45,
                const Color.fromARGB(255, 219, 31, 75),
                const Color.fromARGB(255, 243, 138, 19)),
          ],
        )),
    body: youTubeVideos(context),
  );
}

PreferredSizeWidget youTubeAppBar(BuildContext context) {
  return AppBar(
    iconTheme: const IconThemeData(color: Colors.black),
    leadingWidth: 30,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_rounded, size: 40, color: Colors.red),
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
              builder: (BuildContext context) => PopupMessage(
                message: AppLocalizations.of(context)!.ytTVCast,
              ),
            );
          },
          icon: const Icon(Icons.cast_outlined)),
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

Widget youTubeChannelAvatarIcon(BuildContext context, EdgeInsetsGeometry margin,
    double height, double width, Color begColor, Color endColor) {
  return GradButton(
    margin: margin,
    height: height,
    width: width,
    borderRadius: BorderRadius.circular(100),
    child: const Text(""),
    onPressed: () {},
    gradient: LinearGradient(
      colors: [begColor, endColor],
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
    ),
  );
}

Widget youTubeVideos(BuildContext context) {
  return ListView(
    children: [
      getVideo(
          context,
          getTextThumbnail(AppLocalizations.of(context)!.ytVideoThumbnail),
          getTitleAndChannel(AppLocalizations.of(context)!.ytVideoTitle,
              AppLocalizations.of(context)!.ytVideoChannel)),
      getVideo(
          context,
          getTextThumbnail(AppLocalizations.of(context)!.ytVideoThumbnail),
          getTitleAndChannel(AppLocalizations.of(context)!.ytVideoTitle,
              AppLocalizations.of(context)!.ytVideoChannel)),
      getVideo(
          context,
          getTextThumbnail(AppLocalizations.of(context)!.ytVideoThumbnail),
          getTitleAndChannel(AppLocalizations.of(context)!.ytVideoTitle,
              AppLocalizations.of(context)!.ytVideoChannel)),
      getVideo(
          context,
          getTextThumbnail(AppLocalizations.of(context)!.ytVideoThumbnail),
          getTitleAndChannel(AppLocalizations.of(context)!.ytVideoTitle,
              AppLocalizations.of(context)!.ytVideoChannel)),
    ],
  );
}

BottomNavigationBar youTubeTabBar(
    BuildContext context, void Function(int) change, int index) {
  return BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    currentIndex: index,
    onTap: change,
    selectedItemColor: Colors.black,
    unselectedItemColor: Colors.black,
    showUnselectedLabels: true,
    items: [
      BottomNavigationBarItem(
          icon: const Icon(Icons.home_outlined),
          activeIcon: const Icon(Icons.home),
          label: AppLocalizations.of(context)!.ytHomeBtnText),
      BottomNavigationBarItem(
          icon: const Icon(Icons.play_circle_outlined),
          activeIcon: const Icon(Icons.play_circle),
          label: AppLocalizations.of(context)!.ytShortsBtnText),
      const BottomNavigationBarItem(
          icon: Icon(Icons.add_circle_outline_outlined),
          activeIcon: Icon(Icons.add_circle),
          label: ""),
      BottomNavigationBarItem(
          icon: const Icon(Icons.playlist_play_outlined),
          activeIcon: const Icon(Icons.playlist_play),
          label: AppLocalizations.of(context)!.ytSubsBtnText),
      BottomNavigationBarItem(
          icon: const Icon(Icons.featured_play_list_outlined),
          activeIcon: const Icon(Icons.featured_play_list),
          label: AppLocalizations.of(context)!.ytLibBtnText),
    ],
  );
}

Widget getVideo(BuildContext context, Widget thumbnail, Widget title,
    {bool popOnTap = false}) {
  return GradButton(
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
      child: Column(
        children: [
          thumbnail,
          title,
        ],
      ),
      onPressed: () {
        if (popOnTap) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => YouTubeVideo(
                      context: context,
                    )),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => YouTubeVideo(
                      context: context,
                    )),
          );
        }
      });
}

Widget getTextThumbnail(String text) {
  return Container(
    height: 180,
    padding: const EdgeInsets.all(20),
    child: Center(child: Text(text)),
    color: const Color.fromARGB(255, 202, 202, 202),
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
  );
}

Widget getTitleAndChannel(String title, String channelName) {
  return Row(
    children: [
      Container(
        margin: const EdgeInsets.all(5),
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100), color: Colors.black),
      ),
      Expanded(
          flex: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title),
              Text(
                channelName,
                textScaleFactor: 0.8,
                style: const TextStyle(color: Color.fromARGB(255, 80, 80, 80)),
              )
            ],
          )),
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.more_vert),
      )
    ],
  );
}
