import 'dart:convert';
import 'package:flutter_dependancy_injection/domains/models/meme.dart';
import 'package:http/http.dart' as http;

class MemeRepo {
  Future<Meme> getMeme() async {
    http.Response response = await http.get(Uri.parse("https://some-random-api.ml/meme"));
    Map<String, dynamic> singleMemeJson = jsonDecode(response.body);
    return Meme.fromJson(singleMemeJson);
  }
}