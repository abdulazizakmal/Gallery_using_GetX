import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../Core/Album.dart';
class AlbumApi {

  Future<List<Album>> fetchAlbums() async {
    try {
      String endpoint = "jsonplaceholder.typicode.com";
      // final response =
      // await client.get('https://jsonplaceholder.typicode.com/albums');
      final uri = Uri.http(endpoint,"/albums");
      final response = await http.get(uri);
      var abc = response;
      // Use the compute function to run parsePhotos in a separate isolate.
      return compute(parseAlbums, response.body);
    }
    catch (e){
      var abc =e;
    }
}

// A function that converts a response body into a List<Photo>.
// List<Album> parseAlbums(String responseBody) {
//   final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
//
//   return parsed.map<Album>((json) => Album.fromJson(json)).toList();
// }
}
List<Album> parseAlbums(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Album>((json) => Album.fromJson(json)).toList();
}