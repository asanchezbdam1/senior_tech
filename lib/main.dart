import 'package:flutter/material.dart';
import 'package:senior_tech/app_settings.dart';
import 'package:senior_tech/screens/main_menu.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:senior_tech/screens/settings.dart';
import 'package:senior_tech/tts-control.dart';

void main() {
  runApp(const MyApp());
}

Future config() async {
  TTSControl();
  await AppSettings.load();
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  double fontSize = AppSettings.fontSize;

  void reloadResources() {
    setState(() {
      fontSize = AppSettings.fontSize;
    });
  }

  Future reload(_) async {
    try {
      setState(() {
        fontSize = AppSettings.fontSize;
      });
    } catch (e) {}
  }

  @override
  void initState() {
    AppSettings.updateResources = reloadResources;
    super.initState();
    config().then(reload);
  }

  @override
  Widget build(BuildContext context) {
    // Llamada al constructor para configurar el evento.
    return MaterialApp(
      // No mostrar el Banner de "Debug" en la esquina superior derecha
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        //Locale('en', ''),
        Locale('es', ''),
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: const Color(0xFF273243),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
        ),
        textTheme: Theme.of(context).textTheme.apply(
              fontSizeFactor: fontSize,
              fontSizeDelta: 2.0,
              fontFamily: 'InriaSans',
            ),
      ),
      home: MyHomePage(),
    );
  }
}
