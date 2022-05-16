import 'package:flutter/material.dart';
import 'package:senior_tech/models/security_article.dart';
import 'package:senior_tech/tts-control.dart';

class SecurityArticleView extends StatelessWidget {
  SecurityArticleView(this.article, {Key? key}) : super(key: key);
  SecurityArticle article;

  @override
  Widget build(BuildContext context) {
    TTSControl.setText(article.paragraphs.join(" "));
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
            title: Text(article.title)),
        body: Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: const Color.fromARGB(255, 132, 202, 255)),
            child: ListView(children: getArticleParagraphs(context, article))));
  }
}

List<Widget> getArticleParagraphs(
    BuildContext context, SecurityArticle article) {
  List<Widget> paragraphs = <Widget>[];
  for (var paragraph in article.paragraphs) {
    paragraphs.add(
        Padding(padding: const EdgeInsets.all(15), child: Text(paragraph)));
  }
  return paragraphs;
}
