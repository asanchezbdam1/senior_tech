import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:senior_tech/custom-widgets/grad_button.dart';
import 'package:senior_tech/screens/apps/whatsapp-chat.dart';

class WhatsAppMain extends StatefulWidget {
  final BuildContext context;
  const WhatsAppMain({Key? key, required this.context}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _WhatsAppMainState(context);
}

class _WhatsAppMainState extends State<WhatsAppMain>
    with TickerProviderStateMixin {
  final BuildContext context;
  late TabController _tabController;
  late Widget? _floating = getFloatingButton(null, 1);

  _WhatsAppMainState(this.context);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextButton(
            style: TextButton.styleFrom(primary: Colors.white),
            child: const Text("WhatsApp"),
            onPressed: () => Navigator.pop(context)),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search_outlined)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
        backgroundColor: const Color.fromARGB(255, 48, 149, 109),
        foregroundColor: Colors.white,
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(40),
            child: TabBar(
              labelStyle: Theme.of(context).textTheme.caption,
              isScrollable: true,
              controller: _tabController,
              tabs: [
                const SizedBox(
                    height: 40, child: Icon(Icons.camera_alt_rounded)),
                Text(AppLocalizations.of(context)!.wpChats),
                Text(AppLocalizations.of(context)!.wpStatus),
                Text(AppLocalizations.of(context)!.wpCalls)
              ],
              indicatorColor: Colors.white,
            )),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(30),
              child: Text(AppLocalizations.of(context)!.wpCameraDescription)),
          getChatsList(context),
          getStatusList(context),
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(30),
              child: Text(AppLocalizations.of(context)!.wpCallsDescription))
        ],
      ),
    );
  }
}

Widget getChatsList(BuildContext context) {
  return Scaffold(
      body: ListView(
        children: [
          getChat(context, "18:13"),
          getChat(context, "16:40", iconBgColors: const [
            Color.fromARGB(255, 235, 17, 17),
            Color.fromARGB(255, 235, 173, 17)
          ]),
          getChat(context, AppLocalizations.of(context)!.wpTimeYesterday,
              iconBgColors: const [
                Color.fromARGB(255, 17, 235, 50),
                Color.fromARGB(255, 17, 235, 210)
              ]),
          getChat(context, "03/05/2022", iconBgColors: const [
            Color.fromARGB(255, 17, 17, 235),
            Color.fromARGB(255, 141, 17, 235)
          ]),
          getChat(context, "29/04/2022", iconBgColors: const [
            Color.fromARGB(255, 77, 180, 173),
            Color.fromARGB(255, 138, 59, 142)
          ]),
          getChat(context, "25/04/2022", iconBgColors: const [
            Color.fromARGB(255, 235, 235, 17),
            Color.fromARGB(255, 104, 235, 17)
          ]),
          getChat(context, "22/04/2022", iconBgColors: const [
            Color.fromARGB(255, 17, 231, 235),
            Color.fromARGB(255, 17, 235, 93)
          ]),
          getChat(context, "20/04/2022", iconBgColors: const [
            Color.fromARGB(255, 235, 17, 17),
            Color.fromARGB(255, 224, 17, 235)
          ]),
          getChat(context, "15/04/2022", iconBgColors: const [
            Color.fromARGB(255, 57, 235, 17),
            Color.fromARGB(255, 229, 237, 145)
          ]),
          getChat(context, "12/04/2022", iconBgColors: const [
            Color.fromARGB(255, 68, 235, 17),
            Color.fromARGB(255, 79, 17, 235)
          ]),
          getChat(context, "10/04/2022", iconBgColors: const [
            Color.fromARGB(255, 39, 17, 235),
            Color.fromARGB(255, 61, 235, 17)
          ]),
        ],
      ),
      floatingActionButton: getFloatingButton(context, 0));
}

Widget getChat(BuildContext context, String time,
    {Color iconColor = Colors.white, List<Color>? iconBgColors}) {
  return GradButton(
      padding: EdgeInsets.zero,
      margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
      onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => WhatsAppChat(
                    context: context,
                  ))),
      child: Row(
        children: [
          Container(
            child: Icon(
              Icons.person,
              size: 50,
              color: iconColor,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                gradient: LinearGradient(
                    colors: iconBgColors ?? [Colors.black, Colors.black],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight)),
          ),
          const SizedBox(width: 10),
          Flexible(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  height: 30,
                  child: Row(
                    children: [
                      Flexible(
                          fit: FlexFit.tight,
                          child: Text(
                            AppLocalizations.of(context)!.wpContactName,
                            overflow: TextOverflow.ellipsis,
                          )),
                      const SizedBox(width: 5),
                      Text(
                        time,
                        style: const TextStyle(color: Colors.grey),
                        textScaleFactor: 0.75,
                      )
                    ],
                  )),
              SizedBox(
                child: Column(
                  children: [
                    Flexible(
                        fit: FlexFit.tight,
                        child: Text(
                          AppLocalizations.of(context)!.wpMessage,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(color: Colors.grey),
                          textScaleFactor: 0.85,
                        ))
                  ],
                ),
                height: 30,
              )
            ],
          ))
        ],
      ));
}

Widget getStatusList(BuildContext context) {
  return Scaffold(
      body: Column(
        children: [
          getStatus(
              context,
              const CircleAvatar(
                radius: 25,
                child: Icon(Icons.add, color: Colors.white, size: 35),
                backgroundColor: Color.fromARGB(255, 39, 120, 88),
              ),
              Text(AppLocalizations.of(context)!.wpYourStatus,
                  overflow: TextOverflow.ellipsis),
              Text(
                AppLocalizations.of(context)!.wpAddStatus,
                style: const TextStyle(color: Colors.grey),
                overflow: TextOverflow.ellipsis,
                textScaleFactor: 0.8,
              )),
          const SizedBox(height: 10),
          Text(
            AppLocalizations.of(context)!.wpNotViewedStatus,
            style: const TextStyle(color: Colors.grey),
            textScaleFactor: 0.8,
          ),
          getStatus(
              context,
              CircleAvatar(
                  radius: 30,
                  backgroundColor: const Color.fromARGB(255, 58, 157, 117),
                  child: CircleAvatar(
                      radius: 27,
                      backgroundColor: Colors.white,
                      child: Container(
                        child: const Icon(Icons.person,
                            color: Colors.white, size: 50),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            gradient: const LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 96, 237, 49),
                                  Color.fromARGB(255, 221, 221, 41)
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight)),
                      ))),
              Text(AppLocalizations.of(context)!.wpContactName,
                  overflow: TextOverflow.ellipsis),
              const Text(
                "16:23",
                style: TextStyle(
                    color: Colors.grey, overflow: TextOverflow.ellipsis),
                textScaleFactor: 0.8,
              )),
          getStatus(
              context,
              CircleAvatar(
                  radius: 30,
                  backgroundColor: const Color.fromARGB(255, 58, 157, 117),
                  child: CircleAvatar(
                      radius: 27,
                      backgroundColor: Colors.white,
                      child: Container(
                        child: const Icon(Icons.person,
                            color: Colors.white, size: 50),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            gradient: const LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 49, 231, 237),
                                  Color.fromARGB(255, 77, 41, 221)
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight)),
                      ))),
              Text(AppLocalizations.of(context)!.wpContactName,
                  overflow: TextOverflow.ellipsis),
              const Text(
                "11:53",
                style: TextStyle(color: Colors.grey),
                overflow: TextOverflow.ellipsis,
                textScaleFactor: 0.8,
              )),
          getStatus(
              context,
              CircleAvatar(
                  radius: 30,
                  backgroundColor: const Color.fromARGB(255, 58, 157, 117),
                  child: CircleAvatar(
                      radius: 27,
                      backgroundColor: Colors.white,
                      child: Container(
                        child: const Icon(Icons.person,
                            color: Colors.white, size: 50),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            gradient: const LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 162, 49, 237),
                                  Color.fromARGB(255, 221, 68, 41)
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight)),
                      ))),
              Text(AppLocalizations.of(context)!.wpContactName,
                  overflow: TextOverflow.ellipsis),
              const Text(
                "08:22",
                style: TextStyle(color: Colors.grey),
                overflow: TextOverflow.ellipsis,
                textScaleFactor: 0.8,
              )),
        ],
      ),
      floatingActionButton: getFloatingButton(context, 1));
}

Widget getStatus(
    BuildContext context, Widget image, Widget title, Widget subtitle,
    {VoidCallback? onPressed}) {
  return GradButton(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      onPressed: onPressed ?? () {},
      child: Row(children: [
        image,
        const SizedBox(width: 10),
        Flexible(
            fit: FlexFit.tight,
            child: SizedBox(
              height: 60,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(child: title, fit: FlexFit.tight),
                    subtitle
                  ]),
            ))
      ]));
}

Widget? getFloatingButton(BuildContext? context, int index) {
  return [
    CircleAvatar(
        radius: 30,
        backgroundColor: const Color.fromARGB(255, 48, 149, 109),
        child: IconButton(
          splashRadius: 30,
          iconSize: 30,
          icon: const Icon(Icons.message),
          onPressed: () {},
          color: Colors.white,
          highlightColor: const Color.fromARGB(255, 39, 120, 88),
        )),
    Column(mainAxisAlignment: MainAxisAlignment.end, children: [
      CircleAvatar(
          radius: 25,
          backgroundColor: const Color.fromARGB(255, 203, 203, 203),
          child: IconButton(
            splashRadius: 25,
            iconSize: 25,
            icon: const Icon(Icons.edit),
            onPressed: () {},
            color: const Color.fromARGB(255, 77, 77, 77),
            highlightColor: const Color.fromARGB(255, 203, 203, 203),
          )),
      const SizedBox(height: 25),
      CircleAvatar(
          radius: 30,
          backgroundColor: const Color.fromARGB(255, 48, 149, 109),
          child: IconButton(
            splashRadius: 30,
            iconSize: 30,
            icon: const Icon(Icons.camera_alt_rounded),
            onPressed: () {},
            color: Colors.white,
            highlightColor: const Color.fromARGB(255, 39, 120, 88),
          )),
    ])
  ][index];
}
