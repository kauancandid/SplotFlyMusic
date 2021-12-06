class Product{

  late String title;
  late String singer;
  late String url;
  late String coverUrl;

  Product.fromJson(Map<String, dynamic> json){
    title = json['title'];
    singer = json['singer'];
    url = json['url'];
    coverUrl = json['coverUrl'];
  }
}