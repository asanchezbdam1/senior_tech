import 'package:flutter/material.dart';
import 'package:senior_tech/custom-widgets/expandable_container.dart';
import 'package:senior_tech/custom-widgets/grad_button.dart';
import 'package:senior_tech/screens/apps/youtube.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppList extends StatelessWidget {
  const AppList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFFFF5555),
                  Color(0xFFF39239),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              )),
        ),
        title: const Text("Cómo usar el móvil"),
      ),
      backgroundColor: const Color.fromARGB(255, 241, 173, 173),
      body: ListView(
        children: [
          Center(
              child: Column(
            children: [
              ExpandableContainer(
                message: AppLocalizations.of(context)!.ytDescription,
                paddingTop: 30,
                paddingBottom: 30,
                radius: 20,
                gradient: const LinearGradient(
                  colors: [Color(0xFFF63E3E), Color(0xFFF87239)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                title: const Text(
                  "YouTube",
                  textScaleFactor: 1.2,
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.ytDescription,
                      ),
                      const SizedBox(height: 30),
                      GradButton(
                        color: Colors.white,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => YoutubeMain(
                                  context: context,
                                ),
                              ));
                        },
                        child: const Text("Pulsa aquí para más información"),
                        gradient: const LinearGradient(
                          colors: [Color(0xFFF63E3E), Color(0xFFF87239)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ],
                  ),
                ),
                backgroundColor: Colors.transparent,
                collapsedBackgroundColor: Colors.transparent,
                childBackgroundColor: const Color.fromARGB(255, 255, 200, 195),
              ),
              ExpandableContainer(
                message: AppLocalizations.of(context)!.gpDescription,
                paddingTop: 30,
                paddingBottom: 30,
                radius: 20,
                gradient: const LinearGradient(
                  colors: [Color(0xFF37C65F), Color(0xFF62C832)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                title: const Text(
                  "Google Play",
                  textScaleFactor: 1.2,
                ),
                child: Text(
                  AppLocalizations.of(context)!.gpDescription,
                ),
                backgroundColor: Colors.transparent,
                collapsedBackgroundColor: Colors.transparent,
                childBackgroundColor: Color(0xFFA7F682),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
