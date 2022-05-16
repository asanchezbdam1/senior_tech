import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:senior_tech/app_settings.dart';

class Settings extends StatefulWidget {
  Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool _autoplay = AppSettings.autoplay;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 241, 232, 162),
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 70, 170, 56),
                    Color.fromARGB(255, 232, 218, 112)
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                )),
          ),
          title: Text(AppLocalizations.of(context)!.settings),
        ),
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              Text(AppLocalizations.of(context)!.fontSize),
              Slider(
                  onChanged: (newValue) {
                    setState(() {
                      AppSettings.fontSize = newValue;
                    });
                  },
                  value: AppSettings.fontSize,
                  min: 1.0,
                  max: 2.0,
                  divisions: 10),
              Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 10, 20),
                  child: Row(children: [
                    Text(1.0.toString()),
                    Expanded(
                        child:
                            Text(1.5.toString(), textAlign: TextAlign.center)),
                    Text(2.0.toString())
                  ])),
              ToggleButtons(
                  direction: Axis.vertical,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.play_arrow),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(AppLocalizations.of(context)!.autoPlay),
                        )
                      ],
                    )
                  ],
                  isSelected: [_autoplay],
                  onPressed: (index) {
                    setState(() {
                      _autoplay = !_autoplay;
                      AppSettings.autoplay = _autoplay;
                    });
                  })
            ],
          ),
        ));
  }
}
