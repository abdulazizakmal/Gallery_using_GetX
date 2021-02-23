import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../Core/Photo.dart';

import '../Core/Album.dart';
class PhotosApi {

  Future<List<Photo>> fetchPhotos() async {
    String endpoint = "jsonplaceholder.typicode.com";
    // final response =
    // await client.get('https://jsonplaceholder.typicode.com/albums');
    final uri = Uri.https(endpoint, "/photos");
    final response = await http.get(uri);

    // Use the compute function to run parsePhotos in a separate isolate.
    return compute(parsePhotos, response.body);
  }

// A function that converts a response body into a List<Photo>.

}
List<Photo> parsePhotos(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
}