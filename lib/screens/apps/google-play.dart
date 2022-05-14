import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:senior_tech/custom-widgets/grad_button.dart';

class GooglePlay extends StatefulWidget {
  final BuildContext context;

  const GooglePlay({Key? key, required this.context}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _GooglePlayState();
}

class _GooglePlayState extends State<GooglePlay> {
  int _index = 0;
  List<Widget> _tabBodies = [];

  void _tabChanged(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    _tabBodies = [
      getGamesBody(context),
      getAppBody(context),
      getGamesBody(context),
      getGamesBody(context)
    ];
    return Scaffold(
        appBar: getGooglePlayAppBar(context),
        body: _tabBodies[_index],
        bottomNavigationBar: getGooglePlayTabBar(context, _index, _tabChanged));
  }
}

AppBar getGooglePlayAppBar(BuildContext context) {
  return AppBar(
      toolbarHeight: 80,
      iconTheme:
          const IconThemeData(size: 30, color: Color.fromARGB(255, 82, 82, 82)),
      foregroundColor: const Color.fromARGB(255, 128, 128, 128),
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      automaticallyImplyLeading: false,
      title: Container(
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 214, 231, 244),
              borderRadius: BorderRadius.circular(100)),
          child: Row(children: [
            IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back)),
            Flexible(
                fit: FlexFit.tight,
                child: TextField(
                    decoration: InputDecoration(
                        isDense: true,
                        hintText: AppLocalizations.of(context)!.wpMessageHint,
                        border: InputBorder.none))),
            IconButton(icon: const Icon(Icons.mic), onPressed: () {})
          ])));
}

BottomNavigationBar getGooglePlayTabBar(
    BuildContext context, int index, void Function(int index) onTabChanged) {
  return BottomNavigationBar(
      iconSize: 30,
      selectedLabelStyle: const TextStyle(fontSize: 20),
      unselectedLabelStyle: const TextStyle(fontSize: 20),
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: true,
      elevation: 0,
      currentIndex: index,
      items: [
        getNavigationBarItem(
            context,
            index,
            0,
            const Icon(CupertinoIcons.game_controller_solid),
            AppLocalizations.of(context)!.gpGames),
        getNavigationBarItem(context, index, 1, const Icon(Icons.apps_rounded),
            AppLocalizations.of(context)!.gpApps),
        getNavigationBarItem(context, index, 2, const Icon(Icons.movie_rounded),
            AppLocalizations.of(context)!.gpMovies),
        getNavigationBarItem(context, index, 3, const Icon(Icons.book_rounded),
            AppLocalizations.of(context)!.gpBooks),
      ],
      onTap: onTabChanged,
      selectedItemColor: const Color.fromARGB(255, 7, 50, 86),
      unselectedItemColor: const Color.fromARGB(255, 83, 83, 83));
}

BottomNavigationBarItem getNavigationBarItem(
    BuildContext context, int index, int itemIndex, Icon icon, String label) {
  return BottomNavigationBarItem(
      icon: Container(
        padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: (index == itemIndex)
                ? const Color.fromARGB(255, 143, 199, 245)
                : Colors.transparent),
        child: icon,
      ),
      label: label);
}

Widget getGamesBody(BuildContext context) {
  return ListView(children: [
    GradButton(
        onPressed: () {},
        child: Row(
          children: [
            Flexible(
                child: Text(AppLocalizations.of(context)!.gpRecommended,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center),
                fit: FlexFit.tight),
            const Icon(Icons.arrow_forward, size: 30)
          ],
        )),
    SizedBox(
        height: 275,
        child: ListView(
            scrollDirection: Axis.horizontal,
            children: getRecomendedGames(context))),
    GradButton(
        onPressed: () {},
        child: Row(
          children: [
            Flexible(
                child: Text(AppLocalizations.of(context)!.gpCasual,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center),
                fit: FlexFit.tight),
            const Icon(Icons.arrow_forward, size: 30)
          ],
        )),
    SizedBox(
        height: 275,
        child: ListView(
            scrollDirection: Axis.horizontal,
            children: getCasualGames(context))),
  ]);
}

List<Widget> getRecomendedGames(BuildContext context) {
  return [
    getRecommendedGame(
        context,
        Container(
            child: const Icon(CupertinoIcons.game_controller,
                color: Colors.white, size: 50),
            color: Colors.black),
        Container(
            child:
                const Icon(CupertinoIcons.game_controller, color: Colors.white),
            color: Colors.black),
        AppLocalizations.of(context)!.gpGameName,
        [
          AppLocalizations.of(context)!.gpGameCategoryAction,
          AppLocalizations.of(context)!.gpGameCategoryCasual
        ],
        4.3,
        () {}),
    getRecommendedGame(
        context,
        Container(
            child: const Icon(Icons.bike_scooter,
                color: Color.fromARGB(255, 233, 36, 36), size: 50),
            color: Colors.black),
        Container(
            child: const Icon(Icons.bike_scooter,
                color: Color.fromARGB(255, 233, 36, 36)),
            color: Colors.black),
        AppLocalizations.of(context)!.gpGameName,
        [
          AppLocalizations.of(context)!.gpGameCategoryAction,
          AppLocalizations.of(context)!.gpGameCategoryCasual
        ],
        3.5,
        () {}),
    getRecommendedGame(
        context,
        Container(
            child: const Icon(CupertinoIcons.game_controller,
                color: Color.fromARGB(255, 50, 217, 211), size: 50),
            color: const Color.fromARGB(255, 86, 86, 86)),
        Container(
            child: const Icon(CupertinoIcons.game_controller,
                color: Color.fromARGB(255, 50, 217, 211)),
            color: const Color.fromARGB(255, 86, 86, 86)),
        AppLocalizations.of(context)!.gpGameName,
        [
          AppLocalizations.of(context)!.gpGameCategoryAction,
          AppLocalizations.of(context)!.gpGameCategoryCasual
        ],
        4.2,
        () {}),
  ];
}

List<Widget> getCasualGames(BuildContext context) {
  return [
    getRecommendedGame(
        context,
        Container(
            child: const Icon(CupertinoIcons.train_style_one,
                color: Colors.black, size: 50),
            color: const Color.fromARGB(255, 232, 218, 112)),
        Container(
            child:
                const Icon(CupertinoIcons.train_style_one, color: Colors.black),
            color: const Color.fromARGB(255, 232, 218, 112)),
        AppLocalizations.of(context)!.gpGameName,
        [
          AppLocalizations.of(context)!.gpGameCategoryAction,
          AppLocalizations.of(context)!.gpGameCategoryCasual
        ],
        4.3,
        () {},
        width: 350),
    getRecommendedGame(
        context,
        Container(
            child: const Icon(CupertinoIcons.game_controller,
                color: Color.fromARGB(255, 233, 36, 36), size: 50),
            color: Colors.black),
        Container(
            child: const Icon(CupertinoIcons.game_controller,
                color: Color.fromARGB(255, 233, 36, 36)),
            color: Colors.black),
        AppLocalizations.of(context)!.gpGameName,
        [
          AppLocalizations.of(context)!.gpGameCategoryAction,
          AppLocalizations.of(context)!.gpGameCategoryCasual
        ],
        3.5,
        () {},
        width: 350),
    getRecommendedGame(
        context,
        Container(
            child: const Icon(Icons.piano,
                color: Color.fromARGB(255, 50, 217, 86), size: 50),
            color: const Color.fromARGB(255, 86, 86, 86)),
        Container(
            child: const Icon(Icons.piano,
                color: Color.fromARGB(255, 50, 217, 86)),
            color: const Color.fromARGB(255, 86, 86, 86)),
        AppLocalizations.of(context)!.gpGameName,
        [
          AppLocalizations.of(context)!.gpGameCategoryAction,
          AppLocalizations.of(context)!.gpGameCategoryCasual
        ],
        4.2,
        () {},
        width: 350),
  ];
}

Widget getRecommendedGame(BuildContext context, Widget image, Widget icon,
    String name, List<String> categories, double score, VoidCallback onPressed,
    {double width = 230}) {
  return GradButton(
      width: width,
      height: 275,
      padding: const EdgeInsets.all(5),
      margin: EdgeInsets.zero,
      onPressed: onPressed,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                flex: 6,
                child: FractionallySizedBox(
                    widthFactor: 1,
                    heightFactor: 1,
                    child: ClipRRect(
                        child: image,
                        borderRadius: BorderRadius.circular(20)))),
            Expanded(
                flex: 4,
                child: FractionallySizedBox(
                    widthFactor: 1,
                    heightFactor: 0.8,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Flexible(
                              flex: 4,
                              child: FractionallySizedBox(
                                  widthFactor: 0.8,
                                  heightFactor: 0.8,
                                  child: ClipRRect(
                                      child: icon,
                                      borderRadius:
                                          BorderRadius.circular(15)))),
                          Flexible(
                              flex: 6,
                              fit: FlexFit.tight,
                              child: FractionallySizedBox(
                                  widthFactor: 1,
                                  heightFactor: 1,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Text(name,
                                            overflow: TextOverflow.ellipsis,
                                            textScaleFactor: 0.85),
                                        Text(categories.join(" · "),
                                            overflow: TextOverflow.ellipsis,
                                            textScaleFactor: 0.75,
                                            style: const TextStyle(
                                                color: Color.fromARGB(
                                                    255, 90, 90, 90))),
                                        Row(children: [
                                          Text(score.toString(),
                                              overflow: TextOverflow.ellipsis,
                                              textScaleFactor: 0.7),
                                          const Icon(Icons.star)
                                        ]),
                                      ])))
                        ])))
          ]));
}

Widget getAppBody(BuildContext context) {
  return ListView(children: [
    GradButton(
        onPressed: () {},
        child: Row(
          children: [
            Flexible(
                child: Text(AppLocalizations.of(context)!.gpRecommended,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center),
                fit: FlexFit.tight),
            const Icon(Icons.arrow_forward, size: 30)
          ],
        )),
    SizedBox(
        height: 200,
        child: ListView(
            scrollDirection: Axis.horizontal,
            children: getRecommendedApps(context))),
    GradButton(
        onPressed: () {},
        child: Row(
          children: [
            Flexible(
                child: Text(AppLocalizations.of(context)!.gpRecommended,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center),
                fit: FlexFit.tight),
            const Icon(Icons.arrow_forward, size: 30)
          ],
        )),
  ]);
}

List<Widget> getRecommendedApps(BuildContext context) {
  return [
    getElement(
        context,
        Container(
            color: const Color.fromARGB(255, 79, 160, 103),
            child: const Icon(Icons.whatsapp, color: Colors.white, size: 70)),
        "WhatsApp",
        4.5,
        true,
        null,
        () {}),
    getElement(
        context,
        Container(
            color: const Color.fromARGB(255, 125, 241, 119),
            child: const Icon(Icons.attach_money_rounded,
                color: Color.fromARGB(255, 55, 130, 58), size: 70)),
        AppLocalizations.of(context)!.gpAppPaidName,
        4.9,
        true,
        1.99,
        () {}),
    getElement(
        context,
        Container(
            color: Colors.red,
            child: const Icon(Icons.play_arrow, color: Colors.white, size: 70)),
        "YouTube",
        4.5,
        true,
        null,
        () {}),
    getElement(
        context,
        Container(
            color: Colors.blue,
            child: const Icon(Icons.message, color: Colors.white, size: 70)),
        AppLocalizations.of(context)!.gpAppName,
        4.0,
        true,
        null,
        () {})
  ];
}

Widget getElement(BuildContext context, Widget icon, String name, double score,
    bool isApp, double? price, VoidCallback onPressed) {
  return GradButton(
      width: 150,
      height: isApp ? 200 : 300,
      padding: const EdgeInsets.all(5),
      margin: EdgeInsets.zero,
      onPressed: onPressed,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Flexible(
            flex: 5,
            child: FractionallySizedBox(
                heightFactor: 1,
                widthFactor: 1,
                child: ClipRRect(
                    child: icon, borderRadius: BorderRadius.circular(15)))),
        Flexible(
            flex: 3,
            child: FractionallySizedBox(
                widthFactor: 0.9,
                child: Text(name,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textScaleFactor: 0.75))),
        Expanded(
            flex: 2,
            child: Row(children: [
              Text(score.toString(), textScaleFactor: 0.65),
              const Icon(Icons.star),
              Container(
                  child: (price != null)
                      ? Text(" " + price.toString() + " €",
                          textScaleFactor: 0.65)
                      : null)
            ]))
      ]));
}
