import 'package:flutter/material.dart';
import 'package:senior_tech/custom-widgets/grad_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WhatsAppChat extends StatelessWidget {
  final BuildContext context;

  const WhatsAppChat({Key? key, required this.context}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 235, 233, 210),
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 48, 149, 109),
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: Row(children: [
          GradButton(
            child: Row(
              children: [
                const Icon(Icons.arrow_back, size: 30, color: Colors.white),
                const SizedBox(width: 5),
                Container(
                  child: const Icon(
                    Icons.person,
                    size: 40,
                    color: Colors.white,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      gradient: const LinearGradient(
                          colors: [Colors.orange, Colors.red],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight)),
                )
              ],
            ),
            onPressed: () => Navigator.pop(context),
          ),
          Flexible(
              child: Column(
            children: [
              SizedBox(
                  height: 25,
                  child: Row(children: [
                    Flexible(
                        fit: FlexFit.tight,
                        child: Text(
                          AppLocalizations.of(context)!.wpContactName,
                          overflow: TextOverflow.ellipsis,
                          textScaleFactor: 0.75,
                        ))
                  ])),
              SizedBox(
                  height: 25,
                  child: Row(children: [
                    Flexible(
                        fit: FlexFit.tight,
                        child: Text(
                          AppLocalizations.of(context)!.wpLastTime,
                          overflow: TextOverflow.ellipsis,
                          textScaleFactor: 0.65,
                        ))
                  ]))
            ],
          ))
        ]),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.videocam_rounded),
              iconSize: 30),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.phone), iconSize: 30),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert),
              iconSize: 30),
        ],
      ),
      body: getBody(context),
      bottomNavigationBar: Row(children: [
        const SizedBox(width: 5, height: 70),
        Flexible(
            child: Container(
          height: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100), color: Colors.white),
          child: Row(children: [
            IconButton(
                iconSize: 30,
                color: const Color.fromARGB(255, 143, 143, 143),
                onPressed: () {},
                icon: const Icon(Icons.emoji_emotions_outlined)),
            Flexible(
                fit: FlexFit.tight,
                child: TextField(
                  cursorColor: const Color.fromARGB(255, 48, 149, 109),
                  decoration: InputDecoration(
                    focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(
                            width: 3,
                            color: Color.fromARGB(255, 48, 149, 109))),
                    hintText: AppLocalizations.of(context)!.wpMessageHint,
                  ),
                )),
            IconButton(
                iconSize: 30,
                color: const Color.fromARGB(255, 143, 143, 143),
                onPressed: () {},
                icon: const Icon(Icons.attach_file)),
            IconButton(
                iconSize: 30,
                color: const Color.fromARGB(255, 143, 143, 143),
                onPressed: () {},
                icon: const Icon(Icons.camera_alt_rounded)),
          ]),
        )),
        const SizedBox(width: 5, height: 70),
        CircleAvatar(
            radius: 30,
            backgroundColor: const Color.fromARGB(255, 48, 149, 109),
            child: IconButton(
              splashRadius: 30,
              iconSize: 30,
              icon: const Icon(Icons.mic),
              onPressed: () {},
              color: Colors.white,
              highlightColor: const Color.fromARGB(255, 39, 120, 88),
            )),
        const SizedBox(width: 5, height: 70),
      ]),
    );
  }
}

Widget getBody(BuildContext context) {
  return ListView(padding: const EdgeInsets.all(5), reverse: true, children: [
    Align(
        alignment: Alignment.centerRight,
        child: FractionallySizedBox(
          widthFactor: 0.8,
          child: GradButton(
            padding: const EdgeInsets.all(5),
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(colors: [
              Color.fromARGB(255, 175, 231, 156),
              Color.fromARGB(255, 175, 231, 156)
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            onPressed: () {},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(AppLocalizations.of(context)!.wpMessageFromUser,
                    textScaleFactor: 0.9),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text(
                      "16:15",
                      style:
                          TextStyle(color: Color.fromARGB(255, 143, 143, 143)),
                      textScaleFactor: 0.85,
                    ),
                    Icon(Icons.check, color: Colors.blue),
                    Icon(Icons.check, color: Colors.blue)
                  ],
                ),
              ],
            ),
          ),
        )),
    const SizedBox(height: 5),
    Align(
        alignment: Alignment.centerLeft,
        child: FractionallySizedBox(
          widthFactor: 0.8,
          child: GradButton(
            padding: const EdgeInsets.all(5),
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
                colors: [Colors.white, Colors.white],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            onPressed: () {},
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(AppLocalizations.of(context)!.wpMessage,
                    textScaleFactor: 0.9),
                const Text(
                  "16:15",
                  style: TextStyle(color: Color.fromARGB(255, 143, 143, 143)),
                  textScaleFactor: 0.85,
                ),
              ],
            ),
          ),
        )),
  ]);
}
