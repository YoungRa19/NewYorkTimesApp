import 'package:dio/dio.dart';
import 'package:newyorktimesapp/models/media.dart';

class News {
  String? title;
  String? url;
  String? abstract;
  String? published_date;
  int? id;
  List<Media>? media = [];

  News({
    this.title,
    this.url,
    this.abstract,
    this.published_date,
    this.id,
    this.media,
  });

  factory News.fromMap(Map<String, dynamic> map) {
    // Modificar aquí para que mediadata esté dentro de media
    return News(
      id: map["id"],
      title: map["title"],
      url: map["url"],
      abstract: map["abstract"],
      published_date: map["published_date"],
      media: (map["media"] as List?)
          ?.map((a) => Media.fromMap(a))
          .toList() ?? [],
    );
  }

  static Future<List<News>> getNews() async {
    try {
      final response = await Dio().get(
        'https://api.nytimes.com/svc/mostpopular/v2/viewed/7.json?api-key=L71bZkRRFUZ3NQN6',
      );
      List<dynamic> results = response.data["results"];
      return results.map((news) => News.fromMap(news)).toList();
    } catch (e) {
      print("Error al obtener las noticias: $e");
      return [];
    }
  }
}
