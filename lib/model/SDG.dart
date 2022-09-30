class SDG {
  String id;
  String title;
  String description;
  String imageLink;
  bool isPicked;
  SDG(
      {required this.id,
      required this.title,
      required this.description,
      required this.imageLink,
      this.isPicked = false});
  SDG parseRawJson(Map<dynamic, dynamic> rawJson) {
    id = rawJson["id"].toString();
    title = rawJson["title"];
    description = rawJson["description"];
    imageLink = rawJson["imageLink"];
    return this;
  }
}
