import 'package:flutter/material.dart';
import 'package:senior_tech/screens/main_menu.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:senior_tech/tts-control.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // Llamada al constructor para configurar el evento.
    TTSControl();
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
              fontSizeFactor: 1.5,
              fontSizeDelta: 2.0,
              fontFamily: 'InriaSans',
            ),
      ),
      home: MyHomePage(),
    );
  }
}
