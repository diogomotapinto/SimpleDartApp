import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ImageModel {
  int id;
  String url;
  String title;

  ImageModel({this.id, this.url, this.title});

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      id: json['id'],
      url: json['url'],
      title: json['title'],
    );
  }
}

Future<ImageModel> fetchImage(String id) async {
  final response =
      await http.get('https://jsonplaceholder.typicode.com/photos/$id');

  if (response.statusCode == 200) {
    return ImageModel.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load image');
  }
}
