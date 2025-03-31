import 'package:newyorktimesapp/models/media_data.dart';


class Media {
  String? type;
  String? subtype;
  String? caption;
  String? copyright;
  List<MediaData>? mediadata = [];  // Añadir mediadata aquí

  Media({
    this.type,
    this.subtype,
    this.caption,
    this.copyright,
    this.mediadata,  // Añadir mediadata al constructor
  });

  factory Media.fromMap(Map<String, dynamic> map) {
    return Media(
      type: map["type"],
      subtype: map["subtype"],
      caption: map["caption"],
      copyright: map["copyright"],
      mediadata: (map["mediadata"] as List?)
          ?.map((a) => MediaData.fromMap(a))
          .toList() ?? [],
    );
    }
  }
