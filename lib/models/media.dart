import 'package:newyorktimesapp/models/media_data.dart';


class Media {
  String? type;
  String? subtype;
  String? caption;
  String? copyright;
  String? url;
  MediaData? mediadata; // Añadir mediadata aquí

  Media({
    this.type,
    this.subtype,
    this.caption,
    this.copyright,
    this.url,
    this.mediadata, // Añadir mediadata al constructor
  });

  Media? getMedia(List media) {
    Map? content = media.lastOrNull;

    if (content != null) {
      mediadata = MediaData().getMetaData(content["media-metadata"]);
      return Media(
          type: content["type"],
          subtype: content["subtype"],
          caption: content["caption"],
          copyright: content["copyright"],
          url: mediadata?.url)
        ..mediadata = mediadata;
    }
    return null;
  }

  Map<String, dynamic> toMap() {
    return {
      "type": type,
      "subtype": subtype,
      "caption": caption,
      "url": url,
    };
  }
}