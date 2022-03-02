import 'package:apilesson3/models/news_model.dart';
import 'package:dio/dio.dart';

class NewsService {
  static Future<NewsModel> getNews() async {
    Response res = await Dio().get(
        "https://newsapi.org/v2/everything?q=tesla&from=2022-01-28&sortBy=publishedAt&apiKey=c8e5dafa210540a4859253a87bcd6e81");
    return NewsModel.fromJson(res.data);
  }
}
