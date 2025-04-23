
class MediaData{
  String? format;
  String? url;
  int? width;
  int? height;

  MediaData({
    this.format,
    this.url,
    this.width,
    this.height
  });

  MediaData? getMetaData(List data) {
    print("Contenido recibido en getMetaData:");
    print(data);

    List<MediaData>? medias = data
        .map((object) => MediaData(
        url: object["url"],
        format: object["format"],
        height: object["height"],
        width: object["width"])).toList()
        .where((media) => media.height != null && media.width != null)
        .toList();
      medias.sort((a, b) => (b.width! * b.height!).compareTo(a.width! * a.height!));

    return medias.firstOrNull;
  }

  Map<String, dynamic> toMap() {
    return {
      "format": format,
      "width": width,
      "height": height,
      "url": url,
    };
  }
}