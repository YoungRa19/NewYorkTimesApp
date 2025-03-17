
class MediaData{
  String? format;
  String? url;
  int? weight;
  int? height;

  MediaData({
    this.format,
    this.url,
    this.weight,
    this.height
  });

  factory MediaData.fromMap(Map<String, dynamic> map) {
    return MediaData(
      format: map["format"],
      url: map["url"],
      weight: map["weight"],
      height: map["height"],
    );
  }



}