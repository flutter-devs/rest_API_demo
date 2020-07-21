import 'dart:convert';
import 'dart:async';
import 'fruit.dart';
import 'package:http/http.dart' as http;

Future<List<Fruit>> fetchFruit() async {
  final response = await http.get(
      'url');
  if (response.statusCode == 200) {
    return decodeFruit(response.body);
  } else {
    throw Exception('Unable to fetch data from the REST API');
  }
}

List<Fruit> decodeFruit(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Fruit>((json) => Fruit.fromMap(json)).toList();
}

Future<Fruit> updateFruit(String title) async {
  final http.Response response = await http.put(
    'url',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': title,
    }),
  );

  if (response.statusCode == 200) {
    return Fruit.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to update album.');
  }
}

Future<Fruit> sendFruit(
    String title, int id, String imageUrl, int quantity) async {
  final http.Response response = await http.post(
    'url',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': title,
      'id': id.toString(),
      'imageUrl': imageUrl,
      'quantity': quantity.toString()
    }),
  );
  if (response.statusCode == 201) {
    return Fruit.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}
Future<Fruit> deleteAlbum(int id) async {
  final http.Response response = await http.delete(
    'url/$id',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  if (response.statusCode == 200) {
    return Fruit.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to delete album.');
  }
}