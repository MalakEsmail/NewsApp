import 'package:flutter/material.dart';
import 'package:news_app/utils/constants.dart';
import 'package:news_app/view_models/news_article_list_view_model.dart';
import 'package:news_app/widgets/news_grid.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<NewsArticleListViewModel>(context, listen: false)
        .headTopLines();
  }

  @override
  Widget build(BuildContext context) {
    var listViewModel = Provider.of<NewsArticleListViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              listViewModel.headTopLinesByCountry(Constants.countries[value]);
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) {
              return Constants.countries.keys
                  .map((v) => PopupMenuItem(
                        value: v,
                        child: Text(v),
                      ))
                  .toList();
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text(
                'News',
                style: TextStyle(fontSize: 50),
              ),
            ),
            Divider(
              height: 40,
              color: Color(0xffFF8A30),
              thickness: 8,
              indent: 30,
              endIndent: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 15, bottom: 15),
              child: Text(
                'Headline',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Expanded(child: NewsGrid(listViewModel.articles))
          ],
        ),
      ),
    );
  }
}
