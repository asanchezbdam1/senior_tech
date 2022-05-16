import 'package:flutter/material.dart';
import 'package:senior_tech/app_settings.dart';
import 'package:senior_tech/custom-widgets/grad_button.dart';
import 'package:senior_tech/screens/applist.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:senior_tech/screens/security_sections.dart';
import 'package:senior_tech/screens/settings.dart';
import 'package:senior_tech/tts-control.dart';
import 'package:senior_tech/tts_control_button.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MainMenuState();
}

class _MainMenuState extends State<MyHomePage> {
  OverlayEntry? entry;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) => onBuilt(context));
  }

  @override
  Widget build(BuildContext context) {
    const TextStyle textStyle = TextStyle(
      color: Colors.white,
      fontSize: 30,
      decoration: TextDecoration.none,
    );
    TTSControl.setText(AppLocalizations.of(context)!.titleWelcome);
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: const BoxDecoration(
        color: Color(0xFF273243),
      ),
      child: Center(
        child: ListView(
          children: [
            Text(
              AppLocalizations.of(context)!.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 40,
                decoration: TextDecoration.none,
              ),
            ),
            const SizedBox(height: 30),
            GradButton(
              onPressed: () async {
                await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AppList(),
                    ));
                TTSControl.setText(AppLocalizations.of(context)!.titleWelcome);
              },
              child: Text(
                AppLocalizations.of(context)!.learnApps,
                style: textStyle,
                textAlign: TextAlign.center,
              ),
              gradient: const LinearGradient(
                colors: [Color(0xFFF84545), Color(0xFFAF8312)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(30),
              height: 200,
              width: 250,
            ),
            const SizedBox(height: 30),
            GradButton(
              onPressed: () async {
                await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SecuritySections(),
                    ));
                TTSControl.setText(AppLocalizations.of(context)!.titleWelcome);
              },
              child: Text(
                AppLocalizations.of(context)!.learnSecurity,
                style: textStyle,
                textAlign: TextAlign.center,
              ),
              gradient: const LinearGradient(
                colors: [Color(0xFF1628CF), Color(0xFF2896E5)],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
              borderRadius: BorderRadius.circular(30),
              height: 200,
              width: 250,
            ),
            const SizedBox(height: 30),
            GradButton(
              onPressed: () async {
                await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Settings(),
                    ));
                AppSettings.updateResources();
                AppSettings.save();
                TTSControl.setText(AppLocalizations.of(context)!.titleWelcome);
              },
              child: Text(
                AppLocalizations.of(context)!.settings,
                style: textStyle,
                textAlign: TextAlign.center,
              ),
              gradient: const LinearGradient(
                colors: [
                  Color.fromARGB(255, 70, 170, 56),
                  Color.fromARGB(255, 232, 218, 112)
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
              borderRadius: BorderRadius.circular(30),
              height: 200,
              width: 250,
            ),
          ],
        ),
      ),
    );
  }

  void onBuilt(BuildContext context) {
    entry = OverlayEntry(
        builder: (context) => getControlButton(entry!.markNeedsBuild));
    Overlay.of(context)?.insert(entry!);
  }
}
