import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:senior_tech/custom-widgets/expandable_container.dart';
import 'package:senior_tech/custom-widgets/grad_button.dart';
import 'package:senior_tech/models/security_article.dart';
import 'package:senior_tech/models/security_section.dart';
import 'package:senior_tech/screens/security_articles.dart';

class SecuritySections extends StatelessWidget {
  const SecuritySections({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 94, 179, 248),
        appBar: AppBar(
            flexibleSpace: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF1628CF), Color(0xFF2896E5)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ))),
            title: Text(AppLocalizations.of(context)!.learnSecurity)),
        body: ListView(children: [
          Center(child: Column(children: getSecuritySectionItems(context)))
        ]));
  }
}

List<Widget> getSecuritySectionItems(BuildContext context) {
  List<Widget> sections = <Widget>[];
  for (var section in getSecuritySections(context)) {
    sections.add(getSecuritySectionItem(context, section));
  }
  return sections;
}

Widget getSecuritySectionItem(BuildContext context, SecuritySection section) {
  return ExpandableContainer(
    message: section.description,
    paddingTop: 30,
    paddingBottom: 30,
    radius: 20,
    gradient: const LinearGradient(
      colors: [Color(0xFF1628CF), Color(0xFF2896E5)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    title: Text(section.title, textScaleFactor: 1.2),
    child: Center(
        child: Column(children: [
      Text(section.description),
      const SizedBox(height: 30),
      GradButton(
        padding: const EdgeInsets.all(15),
        color: Colors.white,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SecurityArticles(section),
              ));
        },
        child: Text(AppLocalizations.of(context)!.pressMoreInfo),
        gradient: const LinearGradient(
          colors: [Color(0xFF1628CF), Color(0xFF2896E5)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
    ])),
    backgroundColor: Colors.transparent,
    collapsedBackgroundColor: Colors.transparent,
    childBackgroundColor: const Color.fromARGB(255, 94, 179, 248),
  );
}

List<SecuritySection> getSecuritySections(BuildContext context) {
  return [
    SecuritySection(AppLocalizations.of(context)!.secPasswordsTitle,
        AppLocalizations.of(context)!.secPasswordsDesc, <SecurityArticle>[
      SecurityArticle(AppLocalizations.of(context)!.secPassWriteDown, <String>[
        AppLocalizations.of(context)!.secPassWriteDownP1,
        AppLocalizations.of(context)!.secPassWriteDownP2,
        AppLocalizations.of(context)!.secPassWriteDownP3,
      ]),
      SecurityArticle(AppLocalizations.of(context)!.secPassSafePass, <String>[
        AppLocalizations.of(context)!.secPassSafePassP1,
        AppLocalizations.of(context)!.secPassSafePassP2,
        AppLocalizations.of(context)!.secPassSafePassP3,
      ]),
    ]),
    SecuritySection(AppLocalizations.of(context)!.secNavigationTitle,
        AppLocalizations.of(context)!.secNavigationDesc, <SecurityArticle>[
      SecurityArticle(AppLocalizations.of(context)!.secNavVirus, <String>[
        AppLocalizations.of(context)!.secNavVirusP1,
        AppLocalizations.of(context)!.secNavVirusP2,
        AppLocalizations.of(context)!.secNavVirusP3,
      ]),
      SecurityArticle(AppLocalizations.of(context)!.secNavFalseVirus, <String>[
        AppLocalizations.of(context)!.secNavFalseVirusP1,
        AppLocalizations.of(context)!.secNavFalseVirusP2,
        AppLocalizations.of(context)!.secNavFalseVirusP3,
      ]),
      SecurityArticle(AppLocalizations.of(context)!.secNavScams, <String>[
        AppLocalizations.of(context)!.secNavScamsP1,
        AppLocalizations.of(context)!.secNavScamsP2,
        AppLocalizations.of(context)!.secNavScamsP3,
      ]),
    ]),
    SecuritySection(AppLocalizations.of(context)!.secScamsTitle,
        AppLocalizations.of(context)!.secScamsDesc, <SecurityArticle>[
      SecurityArticle(AppLocalizations.of(context)!.secScamsMail, <String>[
        AppLocalizations.of(context)!.secScamsMailP1,
        AppLocalizations.of(context)!.secScamsMailP2,
        AppLocalizations.of(context)!.secScamsMailP3,
      ])
    ]),
  ];
}
