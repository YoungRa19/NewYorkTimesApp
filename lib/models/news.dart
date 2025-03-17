import 'package:dio/dio.dart';
import 'package:newyorktimesapp/models/media.dart';
import 'package:newyorktimesapp/models/media_data.dart';


class News{
  String? title;
  String? url;
  String? abstract;
  String? published_date;
  int? id;

  List<Media>? media = [];
  List<MediaData>? mediadata = [];


  News({
    this.title,
    this.url,
    this.abstract,
    this.published_date,
    this.id,
    this.media,
    this.mediadata
  });

  static Future<News?> getNews(int id) async {
    try {
      final response = await Dio().get('https://api.nytimes.com/svc/mostpopular/v2/viewed/{1}.json?api-key=L71bZkRRFUZ3NQN6');
      Map<String, dynamic> body = response.data;

      return News(
        id: body["id"],
        title: body["title"],
        url: body["url"],
        abstract: body["abstract"],
        published_date: body["published_date"],
        media: (body["media"] as List?)?.map((a) => Media.fromMap(a["media"])).toList() ?? [],
          mediadata: (["media-metadata"] as List?)?.map((a) => MediaData.fromMap(a["media-metadata"])).toList() ?? []
      );
    } catch (e) {
      print("Error al obtener la Noticia: $e");
      return null;
    }
  }
}


