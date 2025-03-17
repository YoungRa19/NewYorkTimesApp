
class Media{
  String? type;
  String? subtype;
  String? caption;
  String? copyright;

  Media({
    this.type,
    this.subtype,
    this.caption,
    this.copyright
  });

  factory Media.fromMap(Map<String, dynamic> map) {
    return Media(
      type: map["type"],
      subtype: map["subtype"],
      caption: map["caption"],
      copyright: map["copyright"]
    );
  }

}