class ImageModel {
  int id;
  String url;
  String name;

  ImageModel(this.id, this.url, this.name);

  ImageModel.fromJson(parsedJson) {
    id = parsedJson['id'];
    url = parsedJson['url'];
    name = parsedJson['title'];    
  }

}