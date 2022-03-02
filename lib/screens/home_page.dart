import 'package:apilesson3/models/news_model.dart';
import 'package:apilesson3/widgets/news_item.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  NewsModel data;
  MyHomePage({Key? key, required this.data}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          "News 24",
          style: TextStyle(
            color: Color(0XFF180E19),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.data.articles!.length,
              itemBuilder: (ctx, i) {
                return NewsItem.newsItem(context, i, widget.data.articles!);
              },
            ),
          ),
        ],
      ),
    );
  }
}
