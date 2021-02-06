import 'package:flutter/material.dart';
import 'package:news_app/view_models/news_article_view_model.dart';
import 'package:news_app/widgets/circle_image.dart';

class NewsArticleDetailsScreen extends StatelessWidget {
  final NewsArticleViewModel article;
  NewsArticleDetailsScreen(this.article);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/g.png'),
                ),
                SizedBox(
                  width: 5,
                ),
                Container(
                  constraints: BoxConstraints(maxWidth: 150),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Author',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      Text(
                        this.article.auther ?? 'undefined',
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 30, right: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Stack(
                      alignment: Alignment.centerLeft,
                      children: <Widget>[
                        Divider(
                          height: 80,
                          color: Color(0xffFF8A30),
                          thickness: 20,
                        ),
                        Text(
                          ' Headline',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      this.article.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        wordSpacing: 3,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      this.article.publishedAt,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 200,
                      child: CircleImage(
                        this.article.imageUrl,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      this.article.description ?? "No Contents",
                      style: TextStyle(
                        fontSize: 16,
                        wordSpacing: 3,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
