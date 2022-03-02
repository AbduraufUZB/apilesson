import 'package:apilesson3/models/news_model.dart';
import 'package:flutter/material.dart';

class NewsItem {
  static Widget newsItem(BuildContext context, int i, List<Article> data) {
    return InkWell(
      onTap: () {
      },
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.2,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.18,
                width: MediaQuery.of(context).size.height * 0.15,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(data[i].urlToImage ??
                        "https://source.unsplash.com/random/$i"),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        data[i].title.toString(),
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        data[i].author.toString(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.black.withOpacity(0.5)),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "World",
                          style: TextStyle(color: Colors.blue),
                        ),
                        Icon(Icons.more_horiz)
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
