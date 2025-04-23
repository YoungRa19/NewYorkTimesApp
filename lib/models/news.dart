import 'package:dio/dio.dart';
import 'package:newyorktimesapp/models/media.dart';

class News {
  String? title;
  String? url;
  String? abstract;
  String? published_date;
  int? id;
  Media? media;

  News({
    this.title,
    this.url,
    this.abstract,
    this.published_date,
    this.id,
    this.media,
  });

  factory News.fromJson(json) {
    print("Media cruda del JSON:");
    print(json["media"]);

    return News(
      id: json["id"],
      title: json["title"],
      url: json["url"],
      abstract: json["abstract"],
      published_date: json["published_date"],
      media: Media().getMedia(json["media"])

    );
  }

  static Future<List<News>> getNews() async {
    try {
      List<News> news = [];
      final response = await Dio().get(
        'https://api.nytimes.com/svc/mostpopular/v2/shared/1/facebook.json?api-key=trqxewt4zSo1PF8qh11R34spKnb99AyE',
      );
      final results = response.data["results"];
      for (var result in results) {
        news.add(News.fromJson(result));
      }

      return news.where((notice) => notice.media != null).toList();
    } catch (e) {
      print("Error al obtener las noticias: $e");
      print("StackTrace: ${e.toString()}");
      return [];
    }
  }

  Map<String,dynamic> toMap(){
    return{"id":id,"title":title,"url":url,"abstract":abstract,"published_date":published_date,"media":media};
  }
}
