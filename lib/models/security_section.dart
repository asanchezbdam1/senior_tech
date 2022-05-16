import 'package:senior_tech/models/security_article.dart';

class SecuritySection {
  String title;
  String description;
  List<SecurityArticle> articles;
  SecuritySection(this.title, this.description, this.articles);
}
