import 'package:flutter/foundation.dart';
import 'package:news_app/models/news_article.dart';
import 'package:news_app/service/web_service.dart';
import 'package:news_app/view_models/news_article_view_model.dart';

enum LoadingStatus { completed, searching, empty }

class NewsArticleListViewModel with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.empty;
  List<NewsArticleViewModel> articles = List<NewsArticleViewModel>();
  void headTopLinesByCountry(String country) async {
    List<NewsArticle> newsArticles =
        await WebService().fetchTopHeadLinesByCountry(country);
    loadingStatus = LoadingStatus.searching;
    notifyListeners();
    this.articles = newsArticles
        .map((article) => NewsArticleViewModel(article: article))
        .toList();
    if (this.articles.isEmpty) {
      this.loadingStatus = LoadingStatus.empty;
    } else {
      this.loadingStatus = LoadingStatus.completed;
    }
    notifyListeners();
  }

  void headTopLines() async {
    List<NewsArticle> newsArticles = await WebService().fetchTopHeadLines();
    loadingStatus = LoadingStatus.searching;
    notifyListeners();
    this.articles = newsArticles
        .map((article) => NewsArticleViewModel(article: article))
        .toList();
    if (this.articles.isEmpty) {
      this.loadingStatus = LoadingStatus.empty;
    } else {
      this.loadingStatus = LoadingStatus.completed;
    }
    notifyListeners();
  }
}
