import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:senior_tech/custom-widgets/grad_button.dart';
import 'package:senior_tech/models/security_article.dart';
import 'package:senior_tech/models/security_section.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:senior_tech/screens/security_article_view.dart';

class SecurityArticles extends StatelessWidget {
  SecurityArticles(this.section, {Key? key}) : super(key: key);

  SecuritySection section;

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
            title: Text(section.title)),
        body: ListView(
            padding: const EdgeInsets.all(20),
            children: getSecurityArticlesItems(context, section)));
  }
}

List<Widget> getSecurityArticlesItems(
    BuildContext context, SecuritySection section) {
  List<Widget> articles = <Widget>[];
  for (var article in section.articles) {
    articles.add(getSecurityArticlesItem(context, article));
  }
  return articles;
}

Widget getSecurityArticlesItem(BuildContext context, SecurityArticle article) {
  return GradButton(
    margin: const EdgeInsets.all(15),
    padding: const EdgeInsets.all(20),
    color: Colors.white,
    onPressed: () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SecurityArticleView(article),
          ));
    },
    child: Text(article.title),
    gradient: const LinearGradient(
      colors: [Color(0xFF1628CF), Color(0xFF2896E5)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    borderRadius: BorderRadius.circular(20),
  );
}
